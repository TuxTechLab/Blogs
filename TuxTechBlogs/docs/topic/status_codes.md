# **Status Code**

- [**Status Code**](#status-code)
  - [**What Are HTTP Status Codes?**](#what-are-http-status-codes)
  - [**Status Code Details**](#status-code-details)
    - [**1XX HTTP Status Codes**](#1xx-http-status-codes)
    - [**2XX HTTP Status Codes**](#2xx-http-status-codes)
    - [**3XX HTTP Status Codes**](#3xx-http-status-codes)
    - [**4XX HTTP Status Codes**](#4xx-http-status-codes)
    - [**5XX HTTP Status Codes**](#5xx-http-status-codes)
  - [**How to Check the HTTP Status Code of a Page**](#how-to-check-the-http-status-code-of-a-page)
  - [**Error status code impact for short \& longer outage?**](#error-status-code-impact-for-short--longer-outage)

---

## **What Are HTTP Status Codes?**

- An HTTP status code is a three-digit number a server generates in response to a browser’s request Like 404, for example, which you’ve likely seen before.
- Every time you visit a website, your browser sends a request to the site’s server Then, the server responds with an HTTP code status.
- It’s like they’re having a conversation And each code indicates whether things are working or something is wrong.
- The first digit in each status code begins with a number between one and five, indicating the code’s category The second two digits are for specific information under the category.
- For example, let’s use 404 again.

    1 The first digit (4) indicates a client error And specifically, 404 means the server couldn’t find the requested resource.
    2 Meanwhile, 402 also shows a client error And the second and third digits tell us the server found the page but can’t access it due to a payment being required.

---

> ## **The Complete List of HTTP Status Codes**

---

![different*status*codes](./assets/different*status*codes.png)

---

|Status Code| Function|
|----:|:----|
| `1XX — Informational codes` | The server acknowledges and is processing the request |
| `100` | Continue |
| `101` | Switching Protocols |
| `102` | Processing |
| `103` | Early Hints |
| `2XX — Success codes` | The server successfully received, understood, and processed the request |
| `200` | Ok |
| `201` | Created |
| `202` | Accepted |
| `203` | Non-Authoritative Information |
| `204` | No Content |
| `205` | Reset Content |
| `206` | Partial Content |
| `207` | Multi-Status |
| `208` | Already Reported |
| `226` | IM Used |
| `3XX — Redirection codes` | The server received the request, but there’s a redirect to somewhere else (or, in rare cases, some additional action other than a redirect must be completed) |
| `300` | Multiple Choices |
| `301` | Moved Permanently |
| `302` | Found |
| `303` | See Other |
| `304` | Not Modified |
| `307` | Temporary Redirect |
| `308` | Permanent Redirect |
| `4XX — Client error codes` | The server couldn’t find (or reach) the page or website This is an error on the site’s side |
| `400` | Bad Request |
| `401` | Unauthorized |
| `402` | Payment Required |
| `403` | Forbidden |
| `404` | Not Found |
| `405` | Method Not Allowed |
| `406` | Not Acceptable |
| `407` | Proxy Authentication Required |
| `408` | Request Timeout |
| `409` | Conflict |
| `410` | Gone |
| `411` | Length Required |
| `412` | Precondition Failed |
| `413` | Content Too Large |
| `414` | URI Too Long |
| `415` | Unsupported Media Type |
| `416` | Range Not Satisfiable |
| `417` | Expectation Failed |
| `421` | Misdirected Request |
| `422` | Unprocessable Content |
| `423` | Locked |
| `424` | Failed Dependency |
| `425` | Too Early |
| `426` | Upgrade Required |
| `428` | Precondition Required |
| `429` | Too Many Requests |
| `431` | Request Header Fields Too Large |
| `451` | Unavailable for Legal Reasons |
| `5XX — Server error codes` | The client made a valid request, but the server failed to complete the request |
| `500` | Internal Server Error |
| `501` | Not Implemented |
| `502` | Bad Gateway |
| `503` | Service Unavailable |
| `504` | Gateway Timeout |
| `505` | HTTP Version Not Supported |
| `506` | Variant Also Negotiates |
| `507` | Insufficient Storage |
| `508` | Loop Detected |
| `511` | Network Authentication Required |

## **Status Code Details**

### **1XX HTTP Status Codes**

This category is informational, temporary, and invisible to the client It indicates the server received the request and will proceed with it.

- `100 — Continue`: This interim status code means the server received the initial request, and the client should continue.

- `101 — Switching protocols`: This code is a response to an Upgrade header field request and states the protocol the server will switch to.

- `102 — Processing`: This response indicates the server received and is processing the request, but no response is yet available.

- `103 — Early hints`: This code is used with the Link header and allows the browser to preload resources while the server prepares a response.

### **2XX HTTP Status Codes**

This status code category encompasses successful responses.

- `200 — OK`: This is the standard response for successful HTTP requests The actual meaning of the response depends on the request method used:

   ```bash
      GET: Resource obtained and is in the message body
      HEAD: Headers are included in the response
      TRACE: Message body contains the request message as received by the server
      POST or PUT: Resource describing the result of the action sent is in the message body
   ```

- `201 — Created`: The request succeeded and a new resource was created This is usually the response after POST or PUT requests.

- `202 — Accepted`: The request was accepted but is still in progress It’s used for cases where another server handles the request or for batch processing.

- `203 — Non-Authoritative Information`: The data returned isn’t from the origin server Instead, it’s a modified version collected from a third party.

- `204 — No Content`: The request was successfully processed, but there is no content The headers may be useful.

- `205 — Reset Content`: The server fulfilled the request but asked the user to reset the document.

- `206 — Partial Content`: The server is delivering part of the resource This response is used when the client sends a Range header to request only part of a resource.

- `207 — Multi-Status`: Provides the statuses of multiple resources, depending on how many sub-requests were made.

- `208 — Already Reported`: The members of a DAV:propstat element have already been listed and won’t be included again.

- `226 — IM used`: The server completed a GET request And the response indicates one or more instance-manipulation results.

### **3XX HTTP Status Codes**

The status codes in this category show the resource is in a different location, and the user gets redirected as a result.

- `300 — Multiple Choice`: The request has more than one possible response And the user should choose one of them.

- `301 — Moved Permanently`: This redirect status code indicates the requested resource has permanently moved to a new URL The browser displays the new URL.

- `302 — Found`: Previously known as “Moved Temporarily,” this code indicates the requested resource has temporarily moved to a new URL.

- `303 — See Other`: The server redirects the user to the requested resource with a GET request at another URL.

- `304 — Not Modified`: Used for caching purposes The response hasn’t been modified, so the client can continue to use the same cached version of the requested resource.

- `307 — Temporary Redirect`: The requested resource temporarily moved to a different URL The only difference vis-a-vis the 302 code is the user must not change the HTTP method used.

- `308 — Permanent Redirect`: The requested resource permanently moved to a different URL The difference between this code and 301 is the user must not change the HTTP request method.

### **4XX HTTP Status Codes**

This category indicates the server can’t reach a page due to an error on the client side.

- `400 — Bad Request`: The server can’t or won’t process the request due to a client error For example, invalid request message framing, deceptive request routing, size too large, etc.

- `401 — Unauthorized`: The user doesn’t have valid authentication credentials to get the requested resource.

- `402 — Payment Required`: Reserved for future use; it was initially intended for digital payment systems It’s very rarely used, and no standard convention regulates it.

- `403 — Forbidden`: The client doesn’t have access rights to the content For example, it may require a password Unlike the 401 HTTP error code, the server does know the client’s identity.

- `404 — Not Found`: The server can’t find the requested resource, and no redirection has been set 404 errors can harm your SEO efforts.

- `405 — Method Not Allowed`: The server supports the request method, but the target resource doesn’t.

- `406 — Not Acceptable`: The server doesn’t find any content that satisfies the criteria given by the user according to the Accept headers requested.

- `407 — Proxy Authentication Required`: This is similar to a 401, but a proxy must authenticate the client to continue.

- `408 — Request Timeout`: The server timed out waiting because the client didn’t produce a request within the allotted time.

- `409 — Conflict`: The server can’t fulfill the request because there’s a conflict with the resource It’ll display information about the problem so the client can fix it and resubmit.

- `410 — Gone`: The content requested has been permanently deleted from the server and will not be reinstated.

- `411 — Length Required`: The server rejects the request because it requires a defined
Content-Length header field.

- `412 — Precondition Failed`: The client indicates preconditions in the header fields that the server fails to meet.

- `413 — Payload Too Large`: The client’s request is larger than the server’s defined limits, and the server refuses to process it.

- `414 — URI Too Long`: The URI (Uniform Resource Identifier) requested by the client is too long for the server to process.

- `415 — Unsupported Media Type`: The request uses a media format the server does not support.

- `416 — Range Not Satisfiable`: The server can’t fulfill the value indicated in the request’s Range header field.

- `417 — Expectation Failed`: The server can’t meet the requirements indicated by the Expect request header field.

- `421 — Misdirected Request`: The client sends a request to a server that can’t produce a response.

- `422 — Unprocessable Entity`: The client correctly sends the request, but the server can’t process it because of semantic errors or similar issues.

- `423 — Locked`: The requested method’s resource is locked and inaccessible.

- `424 — Failed Dependency`: The request failed because a request the initial request depended on also failed.

- `425 — Too Early`: The server is unwilling to process a request that might be replayed.

- `426 — Update Required`: The server refuses to process the request using the current protocol unless the client upgrades to a different protocol.

- `428 — Precondition Required`: The server needs the request to be conditional.

- `429 — Too Many Requests`: The user sends too many requests in a certain amount of time.

- `431 — Request Header Fields Too Large`: The server can’t process the request because the header fields are too large.

- `451 — Unavailable for Legal Reasons`: The user requests a resource the server can’t legally provide.

### **5XX HTTP Status Codes**

This category includes errors on the server side.

They can be detrimental to your SEO, as search engines can prompt crawlers to slow down with crawling and remove indexed URLs that continually return these errors.

- `500 — Internal Server Error`: The server has encountered an unexpected error and cannot complete the request.

- `501 — Not Implemented`: The server can’t fulfill the request or doesn’t recognize the request method.

- `502 — Bad Gateway`: The server acts as a gateway and gets an invalid response from an inbound host.

- `503 — Service Unavailable`: The server is unable to process the request This often occurs when a server is overloaded or down for maintenance.

- `504 — Gateway Timeout`: The server was acting as a gateway or proxy and timed out, waiting for a response.

- `505 — HTTP Version Not Supported`: The server doesn’t support the HTTP version in the request.

- `506 — Variant Also Negotiates`: The server has an internal configuration error.

- `507 — Insufficient Storage`: The server doesn’t have enough storage to process the request successfully.

- `508 — Loop Detected`: The server detects an infinite loop while processing the request.

- `511 — Network Authentication Required`: The client must be authenticated to access the network The error should include a link where the user can submit credentials.
  
---

## **How to Check the HTTP Status Code of a Page**

   - Some status codes are visible, while others are not If you want to check a page’s HTTP status code, you can use your browser, Google Search Console, or an SEO tool.

     1 Open any page with the Chrome web browser and right-click anywhere on the screen Then, click **"Inspect"**.
        ![webpage*inspect](./assets/webpage*inspect.png)

     2 Now, select **“Network”** on the top menu.
        ![webpage*network*menu](./assets/webpage*network*menu.png)

     3 You should see the status codes under the **“Status”** column.
        ![webpage*network*status](./assets/webpage*network*status.png)
        - Each row represents a resource And each column represents information about the resource.
        - The top resource is usually the HTML document And the last resource is whatever was requested last.
        - You’d use this web browser method if you don’t own or manage the website you’re inspecting.
        - If you do own the webpage, the best way to check its HTTP status code is to use Google Search Console.

   - Progratically using scripts or binaries you can check the Status code of web applications.

   - CLI based tools/ UI based Web Applications can also be used to check status code.

---

## **Error status code impact for short & longer outage?**

If a webpage or API is giving error status codes for short durations or longer outages, it can have several consequences for the users and the business:

> **Short Duration Errors/ Outages**

   1 *Inconvenience to users*: Users may experience temporary errors while accessing the webpage or API, which can be frustrating and may lead to a negative user experience.
   2 *Loss of data*: If the error occurs during a critical transaction, such as a payment or data submission, users may lose their progress and have to start again.
   3 *Decreased productivity*: If the error occurs frequently, users may lose time and productivity trying to resolve the issue or find workarounds.

> **Longer Duration Errors/ Outages:**

   1 *Loss of revenue*: If the error occurs during a critical transaction, such as a payment or sales, the business may lose revenue and customers.
   2 *Decreased user trust*: Frequent errors can lead to a loss of trust among users, which can negatively impact the business's reputation and customer loyalty.
   3 *Increased support requests*: Longer duration errors can lead to an increase in support requests, which can be time-consuming and costly to resolve.
   4 *Negative impact on SEO*: If the errors are not resolved quickly, it can negatively impact the business's search engine optimization (SEO) and reputation.
   5 *Loss of data*: If the error occurs during a critical transaction, such as a payment or data submission, the business may lose important data, which can be difficult and costly to recover.
   6 *Legal and compliance issues*: Depending on the nature of the error, it may lead to legal and compliance issues, such as data breaches or non-compliance with regulations.
   7 *Increased maintenance costs*: Longer duration errors can lead to increased maintenance costs, as the business may need to invest in additional resources to resolve the issue.
   8 *Decreased employee productivity*: If the error occurs frequently, employees may spend more time trying to resolve the issue, which can decrease their productivity and morale.

> **To mitigate the risks associated with error status codes, it is important to have a robust error handling process in place, which includes:**

   1 *Monitoring and logging*: Implementing monitoring and logging tools to track errors and identify the root cause.
   2 *Error handling protocols*: Establishing error handling protocols to ensure that errors are resolved quickly and effectively.
   3 *Communication*: Communicating with users and stakeholders about the error and the steps being taken to resolve it.
   4 *Training*: Providing training to employees on error handling and troubleshooting.
   5 *Regular maintenance*: Regularly maintaining and updating the system to prevent errors and improve performance.
   6 *Redundancy*: Implementing redundancy measures to ensure that the system remains available even in the event of an error.
