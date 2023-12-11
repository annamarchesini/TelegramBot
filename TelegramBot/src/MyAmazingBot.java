import org.telegram.telegrambots.meta.api.methods.updatingmessages.DeleteMessage;
import org.telegram.telegrambots.meta.api.objects.Message;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import java.io.IOException;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;



class MyAmazingBot extends TelegramLongPollingBot {

    static java.sql.Connection conn1 = null;


    public String getBotUsername() {
        return "marchesini_5CII_bot";
    }
    @Override
    public String getBotToken() {
        return "6704028194:AAFCvQLU8DoMqs14pMJ1vY_-Rb4O9Ho6Lvg";
    }

    private boolean SP = false;
    private boolean SP1 = false;
    private boolean ATC = false;
    private boolean LoadM0 = false;
    private boolean LoadM1 = false;
    private Message lastSentMessage = null;

    private boolean DI = false;
    private String Addurl = "https://www.amazon.com/s?k=";

    public void onUpdateReceived(Update update) {
        String msg = update.getMessage().getText();
        String chatId=update.getMessage().getChatId().toString();


        switch (msg) {
            case "/start":
                sendStart(chatId);

                LoadM0 = false;
                LoadM1 = false;

                break;

            case "/searchproduct":
                SendMessage("Type the product you want to search: ", chatId);

                SP = true;
                LoadM0 = true;
                LoadM1 = false;
                break;

            case "/addtowishlist":

                PrintTable(chatId, "InfoProducts",10);
                SendMessage("/loadmore",chatId);

                SendMessage IDrequest = new SendMessage();

                IDrequest.setChatId(chatId);
                IDrequest.setText("Type the ID of the product you wanna add to your wishlist: ");
                IDrequest.setParseMode("Markdown");

                try {
                    lastSentMessage =  execute(IDrequest);
                } catch (TelegramApiException e) {
                    e.printStackTrace();
                }

                LoadM0 = false;
                LoadM1 = true;
                ATC = true;
                break;

            case "/printwishlist":

                PrintTable(chatId, "WishList", Integer.MAX_VALUE);

                LoadM0 = false;
                LoadM1 = false;
                break;

            case "/loadmore":

                if (LoadM1) {
                    deleteLastMessage(chatId);
                }

                if(LoadM0 || LoadM1) {
                    try {
                        LoadMore(LoadM0,LoadM1,chatId);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    if(LoadM1){
                        SendMessage ("Type the ID of the product you wanna add to your wishlist: ", chatId);
                    }
                }
                else{
                    UnknownMessage(chatId);
                }

                LoadM0 = false;
                LoadM1 = false;
                break;

            case "/emptywishlist":

                try {
                    EmptyWishList();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                LoadM0 = false;
                LoadM1 = false;
                break;

            case "/deleteproduct":

                PrintTable(chatId, "WishList",Integer.MAX_VALUE);
                SendMessage("Type the ID of the product you wanna delete from your wishlist: ", chatId);

                DI = true;
                LoadM0 = false;
                LoadM1 = false;
                break;

            default:

                if(SP){
                    if(!SP1){

                        Addurl += msg.replaceAll("\\s", "+");

                        SendMessage("Serch by: \n\n"
                                + "/BestSeller - Find the best sellers\n\n"
                                + "/Featured - Find the most relevant products\n\n"
                                + "/LowToHigh - Find the cheapest products\n\n"
                                + "/HighToLow - Find the most expensive products\n\n"
                                + "/AvgCustRev - Find the products based on the avarage customer review\n\n"
                                + "/NewArrival - Find the newest arrivals\n\n",chatId);

                        SP1 = true;
                    }
                    else{

                        String url = "";
                        switch (msg) {

                            case "/BestSeller":
                                url = Addurl+"&s=exact-aware-popularity-rank";
                                try {
                                    WebCrawler(1, url, chatId);
                                } catch (SQLException e) {
                                    throw new RuntimeException(e);
                                }
                                break;

                            case "/Featured":
                                url = Addurl+"&s=relevanceblender";
                                try {
                                    WebCrawler(1, url, chatId);
                                } catch (SQLException e) {
                                    throw new RuntimeException(e);
                                }
                                break;

                            case "/LowToHigh":
                                url = Addurl+"&s=price-asc-rank";
                                try {
                                    WebCrawler(1, url, chatId);
                                } catch (SQLException e) {
                                    throw new RuntimeException(e);
                                }
                                break;

                            case "/HighToLow":
                                url = Addurl+"&s=price-desc-rank";
                                try {
                                    WebCrawler(1, url, chatId);
                                } catch (SQLException e) {
                                    throw new RuntimeException(e);
                                }
                                break;

                            case "/AvgCustRev":
                                url = Addurl+"&s=review-rank";
                                try {
                                    WebCrawler(1, url, chatId);
                                } catch (SQLException e) {
                                    throw new RuntimeException(e);
                                }
                                break;

                            case "/NewArrival":
                                url = Addurl+"&s=date-desc-rank";
                                try {
                                    WebCrawler(1, url, chatId);
                                } catch (SQLException e) {
                                    throw new RuntimeException(e);
                                }
                                break;
                            }
                        SP = false;
                        SP1 = false;
                    }

                }
                else if(ATC){

                    try {
                        AddToWishList(msg, chatId);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }

                    ATC = false;
                }
                else if(DI){

                    try {
                        DeleteProduct(msg,chatId);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }

                    DI = false;
                }
                else{
                    UnknownMessage(chatId);
                    break;
                }

        }


    }


    private void sendStart(String chatId) {
        String start = "Explore Amazon products with the following commands:\n"
                + "/start - Display this menu\n"
                + "/searchproduct - Search for a product on Amazon\n"
                + "/addtowishlist - Add a product to your wishlist\n"
                + "/printwishlist - View your wishlist\n"
                + "/emptywishlist - Empty your wishlist\n"
                + "/deletewishlist - Remove a product from your wishlist";


        SendMessage sendStartMsg = new SendMessage();
        sendStartMsg.setChatId(chatId);
        sendStartMsg.setText(start);

        try {
            execute(sendStartMsg);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    private  void UnknownMessage(String chatId){
        SendMessage sendStartMsg = new SendMessage();
        sendStartMsg.setChatId(chatId);
        sendStartMsg.setText("I didn't understand the message");

        try {
            execute(sendStartMsg);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    public void WebCrawler(int level, String url, String chatId) throws SQLException {

        conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1/TelegramBot", "root", "");
        Statement statement = conn1.createStatement();
        statement.executeUpdate("truncate table infoproducts");


        try {
            Document document = Jsoup.connect(url).userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.38 Safari/537.36").get();

            if (document != null) {

                int c = 0;

                for (Element listItem : document.select("div.puis-card-container.s-card-container.s-overflow-hidden.aok-relative.puis-include-content-margin.puis.puis-v25h6k2ialgxcx2aefs5gqn1u23.s-latency-cf-section.puis-card-border")) {

                    String rating = "";
                    if (listItem.selectFirst("i") != null) {
                        rating = listItem.selectFirst("i").text();
                    }

                    String price = "";
                    if (listItem.selectFirst("span.a-offscreen") != null) {
                        price = listItem.selectFirst("span.a-offscreen").text();
                    }

                    String delivery = "";
                    if (listItem.selectFirst("div.a-row.a-size-base.a-color-secondary.s-align-children-center") != null) {
                        delivery = listItem.selectFirst("div.a-row.a-size-base.a-color-secondary.s-align-children-center").text();
                    }

                    Element link = listItem.selectFirst("a[href].a-link-normal.s-underline-text.s-underline-link-text.s-link-style.a-text-normal");
                    String title = "";
                    String titlelink = "";
                    if (link != null) {

                        if (link.selectFirst("span") != null) {
                            title = link.selectFirst("span").text();
                        }
                        if (link != null) {
                            titlelink = link.absUrl("href");
                        }
                    }

                    if(c < 10) {
                        SendMessage productInfo = new SendMessage();
                        productInfo.setChatId(chatId);
                        productInfo.setText("[" + title + "](" + titlelink + ")"
                                + "\n" + price
                                + "\n" + rating
                                + "\n" + delivery);

                        productInfo.setParseMode("Markdown");


                        try {
                            execute(productInfo);
                        } catch (TelegramApiException e) {
                            e.printStackTrace();
                        }
                    }

                    c++;


                    try {
                        String query = "INSERT INTO infoproducts (title, title_link, price, rating, delivery) VALUES (?, ?, ?, ?, ?)";
                        PreparedStatement preparedStatement = conn1.prepareStatement(query);
                        preparedStatement.setString(1, title);
                        preparedStatement.setString(2, titlelink);
                        preparedStatement.setString(3, price);
                        preparedStatement.setString(4, rating);
                        preparedStatement.setString(5, delivery);


                        preparedStatement.executeUpdate();
                        preparedStatement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }



                }

                SendMessage("/loadmore", chatId);

            }
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());

        }



    }

    private void PrintTable(String chatId,String table, Integer a){
        try {
            conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1/TelegramBot", "root", "");
            String query = "SELECT id, title, title_link, price, rating, delivery FROM " + table;
            PreparedStatement preparedStatement = conn1.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (!resultSet.isBeforeFirst()){
                SendMessage("Your wishlist is empty", chatId);
            }
            else {
                int c = 0;

                while (resultSet.next() && c < a) {
                    String id = resultSet.getString("id");
                    String title = resultSet.getString("title");
                    String titlelink = resultSet.getString("title_link");
                    String price = resultSet.getString("price");
                    String rating = resultSet.getString("rating");
                    String delivery = resultSet.getString("delivery");


                    if (table == "InfoProducts") {
                        SendMessage(id + ". " + "[" + title + "](" + titlelink + ")", chatId);
                    } else {
                        SendMessage(id + ". " + "[" + title + "](" + titlelink + ")" + "\n" + price + "\n" + rating + "\n" + delivery, chatId);
                    }

                    c++;
                }
            }

            preparedStatement.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void AddToWishList(String id, String chatId) throws SQLException {


        conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1/TelegramBot", "root", "");
        String getquery = "SELECT id, title, title_link, price, rating, delivery FROM InfoProducts WHERE id LIKE ?";

        PreparedStatement getStatement = conn1.prepareStatement(getquery);
        getStatement.setString(1, id);
        ResultSet resultSet = getStatement.executeQuery();

        String title = "";
        String titlelink = "";
        String price = "";
        String rating = "";
        String delivery = "";

        while (resultSet.next()) {
            title = resultSet.getString("title");
            titlelink = resultSet.getString("title_link");
            price = resultSet.getString("price");
            rating = resultSet.getString("rating");
            delivery = resultSet.getString("delivery");
        }

        getStatement.close();

        if(title != "" && titlelink != "" && price != "" && rating != "" && delivery != "") {

            try {
                String setquery = "INSERT INTO WishList (title, title_link, price, rating, delivery) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement setStatement = conn1.prepareStatement(setquery);
                setStatement.setString(1, title);
                setStatement.setString(2, titlelink);
                setStatement.setString(3, price);
                setStatement.setString(4, rating);
                setStatement.setString(5, delivery);

                setStatement.executeUpdate();
                setStatement.close();

                SendMessage(title + " was successfully added to your WishList", chatId);


            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else{
            SendMessage("No item found with ID " + id + " in your WishList", chatId);
        }

    }

    private void LoadMore(Boolean L0, Boolean L1, String chatId) throws SQLException {

        conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1/TelegramBot", "root", "");
        String query = "SELECT id, title, title_link, price, rating, delivery FROM InfoProducts WHERE id > 10";
        PreparedStatement preparedStatement = conn1.prepareStatement(query);
        ResultSet resultSet = preparedStatement.executeQuery();


        if(L0) {

            while (resultSet.next()) {
                String title = resultSet.getString("title");
                String titlelink = resultSet.getString("title_link");
                String price = resultSet.getString("price");
                String rating = resultSet.getString("rating");
                String delivery = resultSet.getString("delivery");

                SendMessage("[" + title + "](" + titlelink + ")"
                        + "\n" + price
                        + "\n" + rating
                        + "\n" + delivery, chatId);
            }
        }
        if(L1){
            while (resultSet.next()){

                String id = resultSet.getString("id");
                String title = resultSet.getString("title");
                String titlelink = resultSet.getString("title_link");
                String price = resultSet.getString("price");
                String rating = resultSet.getString("rating");
                String delivery = resultSet.getString("delivery");

                SendMessage(id + ". " + "[" + title + "](" + titlelink + ")"
                        + "\n" + price
                        + "\n" + rating
                        + "\n" + delivery, chatId);
            }
        }

        preparedStatement.close();
    }

    private void EmptyWishList() throws SQLException {
        conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1/TelegramBot", "root", "");
        Statement statement = conn1.createStatement();
        statement.executeUpdate("truncate table wishlist");

    }

    private void DeleteProduct(String id, String chatId) throws SQLException {
        conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1/TelegramBot", "root", "");
        String selectQuery = "SELECT title FROM WishList WHERE id LIKE ?";
        PreparedStatement selectStatement = conn1.prepareStatement(selectQuery);
        selectStatement.setString(1, id);
        ResultSet resultSet = selectStatement.executeQuery();

        if (resultSet.next()) {
            String title = resultSet.getString("title");

            String deleteQuery = "DELETE FROM WishList WHERE id LIKE ?";
            PreparedStatement deleteStatement = conn1.prepareStatement(deleteQuery);
            deleteStatement.setString(1, id);
            int rowsAffected = deleteStatement.executeUpdate();

            if (rowsAffected > 0) {

                String updateQuery = "UPDATE WishList SET id = id - 1 WHERE id > ?";
                PreparedStatement updateStatement = conn1.prepareStatement(updateQuery);
                updateStatement.setInt(1, Integer.parseInt(id));
                updateStatement.executeUpdate();

                SendMessage(title + " was successfully deleted from your wishlist", chatId);
            } else {
                SendMessage("No item found with ID " + id + " in your wishlist", chatId);
            }

            deleteStatement.close();
        } else {
            SendMessage("No item found with ID " + id + " in your wishlist", chatId);
        }

        selectStatement.close();
    }

    private void SendMessage(String message, String chatId){
        SendMessage msg = new SendMessage();
        msg.setChatId(chatId);
        msg.setText(message);

        msg.setParseMode("Markdown");

        try {
            execute(msg);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    private void deleteLastMessage(String chatId) {
        if (lastSentMessage != null) {
            DeleteMessage deleteMessage = new DeleteMessage();
            deleteMessage.setChatId(chatId);
            deleteMessage.setMessageId(lastSentMessage.getMessageId());
            try {
                execute(deleteMessage);
            } catch (TelegramApiException e) {
                e.printStackTrace();
            }
        }
    }
}