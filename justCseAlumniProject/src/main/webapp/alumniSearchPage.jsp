<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Find Alumni</title>


<style>

/* =========================
   BASIC
========================= */

* {
    box-sizing: border-box;
}

html, body {
    height: 100%;
    margin: 0;
}

body {
    display: flex;
    flex-direction: column;

    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

    background: linear-gradient(
        135deg,
        #6a11cb,
        #2575fc
    );
}


/* =========================
   HEADER
========================= */

header {

    background: rgba(255,255,255,0.15);

    backdrop-filter: blur(10px);

    padding: 18px 40px;

    display: flex;

    justify-content: space-between;

    align-items: center;

    color: white;
}

header h1 {

    margin: 0;

    font-size: 22px;

    letter-spacing: 1px;
}

.header-right {

    font-size: 14px;

    opacity: 0.9;
}


/* =========================
   MAIN
========================= */

.main {

    flex: 1;

    display: flex;

    justify-content: center;

    align-items: center;

    padding: 30px 20px;
}


/* =========================
   CONTAINER
========================= */

.container {

    width: 100%;

    max-width: 800px;

    background: white;

    border-radius: 16px;

    padding: 35px;

    box-shadow:
        0 15px 40px rgba(0,0,0,0.25);
}


/* =========================
   TITLE
========================= */

.title {

    text-align: center;

    margin-bottom: 30px;
}

.title h2 {

    margin: 0;

    color: #6a11cb;

    font-size: 28px;
}

.title p {

    margin-top: 8px;

    color: #777;

    font-size: 14px;
}


/* =========================
   FORM
========================= */

form {

    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 20px;
}


.field {

    display: flex;

    flex-direction: column;
}


.field label {

    font-size: 13px;

    font-weight: 600;

    color: #555;

    margin-bottom: 7px;
}


input,
select {

    width: 100%;

    padding: 12px;

    border: 1px solid #ccc;

    border-radius: 8px;

    font-size: 14px;

    outline: none;

    transition: 0.3s;
}


input:focus,
select:focus {

    border-color: #6a11cb;

    box-shadow:
        0 0 8px rgba(106,17,203,0.2);
}


/* =========================
   FULL WIDTH
========================= */

.full {

    grid-column: span 2;
}


/* =========================
   BUTTONS
========================= */

.buttons {

    display: flex;

    gap: 12px;

    margin-top: 5px;
}


button {

    flex: 1;

    padding: 12px;

    border: none;

    border-radius: 8px;

    font-size: 15px;

    font-weight: 600;

    cursor: pointer;

    transition: 0.3s;
}


.search {

    color: white;

    background:
        linear-gradient(
            135deg,
            #6a11cb,
            #2575fc
        );
}


.search:hover {

    opacity: 0.9;

    transform: translateY(-1px);
}


.reset {

    background: #eeeeee;

    color: #555;
}


.reset:hover {

    background: #dddddd;
}


/* =========================
   HINT
========================= */

.hint {

    margin-top: 22px;

    padding: 12px;

    background: #f7f4ff;

    border-left: 4px solid #6a11cb;

    border-radius: 6px;

    color: #666;

    font-size: 13px;

    text-align: center;
}


/* =========================
   FOOTER
========================= */

footer {

    text-align: center;

    padding: 15px;

    background: rgba(0,0,0,0.25);

    color: white;

    font-size: 14px;
}


/* =========================
   RESPONSIVE
========================= */

@media (max-width: 600px) {

    .container {

        padding: 25px 20px;
    }

    form {

        grid-template-columns: 1fr;
    }

    .full {

        grid-column: span 1;
    }

    .buttons {

        flex-direction: column;
    }

    .title h2 {

        font-size: 24px;
    }

}

</style>

</head>


<body>


<!-- =========================
     HEADER
========================= -->

<header>

    <h1>Alumni Portal</h1>

    <div class="header-right">
        Find & Connect with Alumni
    </div>

</header>



<!-- =========================
     MAIN
========================= -->

<div class="main">

    <div class="container">


        <!-- TITLE -->

        <div class="title">

            <h2>Find Alumni</h2>

            <p>
                Search alumni using one or multiple filters
            </p>

        </div>



        <!-- =========================
             SEARCH FORM
        ========================= -->

        <form
            action="searchAlumniServlet"
            method="post">


            <!-- NAME -->

            <div class="field">

                <label for="name">
                    Name
                </label>

                <input
                    type="text"
                    id="name"
                    name="name"
                    placeholder="e.g. Rahim, Tirtho">

            </div>



            <!-- BATCH -->

            <div class="field">

                <label for="batch">
                    Batch
                </label>

                <select
                    id="batch"
                    name="batch">

                    <option value="">
                        Select Batch
                    </option>

                    <option value="1">Batch 1</option>
                    <option value="2">Batch 2</option>
                    <option value="3">Batch 3</option>
                    <option value="4">Batch 4</option>
                    <option value="5">Batch 5</option>
                    <option value="6">Batch 6</option>
                    <option value="7">Batch 7</option>
                    <option value="8">Batch 8</option>
                    <option value="9">Batch 9</option>
                    <option value="10">Batch 10</option>
                    <option value="11">Batch 11</option>
                    <option value="12">Batch 12</option>
                    <option value="13">Batch 13</option>
                    <option value="14">Batch 14</option>
                    <option value="15">Batch 15</option>
                    <option value="16">Batch 16</option>
                    <option value="17">Batch 17</option>

                </select>

            </div>



            <!-- SKILL -->

            <div class="field">

                <label for="skill">
                    Skill
                </label>

                <input
                    type="text"
                    id="skill"
                    name="skill"
                    placeholder="e.g. Java, React, Python">

            </div>



            <!-- COMPANY -->

            <div class="field">

                <label for="company">
                    Company
                </label>

                <input
                    type="text"
                    id="company"
                    name="company"
                    placeholder="e.g. Google, Microsoft">

            </div>



            <!-- BUTTONS -->

            <div class="full buttons">

                <button
                    type="submit"
                    class="search">

                    🔍 Search Alumni

                </button>


                <button
                    type="reset"
                    class="reset">

                    Clear

                </button>

            </div>


        </form>



        <!-- HINT -->

        <div class="hint">

            💡 You can search using any one field
            or combine multiple fields together.

        </div>


    </div>

</div>



<!-- =========================
     FOOTER
========================= -->

<footer>

    © 2026 All Rights Reserved by
    <strong>tirtho_saha</strong>

</footer>


</body>

</html>