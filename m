Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF813D4D56
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jul 2021 14:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbhGYLpf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 25 Jul 2021 07:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbhGYLpf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Jul 2021 07:45:35 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4279C061757
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Jul 2021 05:26:05 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id hu11so3717772qvb.7
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Jul 2021 05:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=pq8QdcgdNxjJmg61r8dPGvWyeowRsap/Qds2NQHbQZA=;
        b=lG8HbUwtT054v5kPlmESHTUYoQMTBEJ4H5u3JvCiVF+vuZlvOLOGGNqaiH4QSt9yhK
         KPg+2m6wIDF/mAGcp2G9kEQ+I4XJSM0Zjw89h3ydEM3YjzDT5rlFFPEQimRN1FhiOhNA
         tVlC1QRdi6mqjXx/GZAaFvqOCrCAuoAfBvbdfNPuUlxotRqvgLTxLxGD4skNwz3DfkVh
         zWtWOmcPUM/PtsT3N1S3/ZnIDu/q2xA+UWdYL6V7KZWeC66P+iOprrS5zZOACBGr8YSx
         vrkIZvSCiqVT6OsEhdTtVzA7goI7DPIBFRVWLMtckynY3NqcySiOsPEvzIfbRWggsov5
         aO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=pq8QdcgdNxjJmg61r8dPGvWyeowRsap/Qds2NQHbQZA=;
        b=jnNHZ7FTJjIAvHVV7fg7iJM8z1viuCHXatplyNi5DBDZc0EE7E15CRm+K9vcc2aZX6
         RtG7WISrhfiMwVChENgHzaVaSrf4ZDJ5badhmC5ejcEpfLA8fp12ZqE95CR+juG5ZU/S
         HKQqirmIhhnfyfpDWbf+8X2b76ftSyRVw8+akoVomHhDK0V3Qx64rNXL3Ugqoh+jO7+s
         355Vn6CaEBGQyfDL0Zafg0VpAhLiHWVQjFTpRK+BWTeJA6VwU9IVi6BPLmzGQho10EDZ
         xGpJLKXXUVaJCwlPjPsBv0XeN9rVd/y7G6WZfXyCyND/nV0gL1gfwkfT4D7LsePjnuHv
         BAPA==
X-Gm-Message-State: AOAM5305g1A6T/zL4gDCWz0z+0eIJQUkrkH3YJyW3Z6TYnj36za34isr
        xonNJrBxvkujXPrVrXajeFmMOrkRgbRWJN6+1Dg=
X-Google-Smtp-Source: ABdhPJyU8ROK0S+A4qXGMaKXWA6PoQJdT4VP6rSSq0Wkt0SXgzwfHnzGyKNdFQLxiUs809TcId+Hw+yIDD2mg0q+oO8=
X-Received: by 2002:a05:6214:10c8:: with SMTP id r8mr13473981qvs.28.1627215964579;
 Sun, 25 Jul 2021 05:26:04 -0700 (PDT)
MIME-Version: 1.0
Reply-To: bouchetb@yandex.com
Sender: mrhassanahmed0@gmail.com
Received: by 2002:a0c:bf52:0:0:0:0:0 with HTTP; Sun, 25 Jul 2021 05:26:03
 -0700 (PDT)
From:   Bryan Bouchet <bryanbouchet0@gmail.com>
Date:   Sun, 25 Jul 2021 13:26:03 +0100
X-Google-Sender-Auth: MfewjimTcaf6FPjz-wo-NYt_DwU
Message-ID: <CAMx_adgdiVKgbROGehNh8GYbYx4aquGssb8_McewX+7N68Cp1w@mail.gmail.com>
Subject: PLEASE RESPOND VERY URGENTLY
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Dear Friend,

With due respect, i have decided to contact you on a business
transaction that will be beneficial to both of us. At the bank last
account and auditing evaluation, my staffs came across an old account
which was being maintained by a foreign client who we learn was among
the deceased passengers of motor accident on November.2003, the
deceased was unable to run this account since his death. The account
has remained dormant without the knowledge of his family since it was
put in a safe deposit account in the bank for future investment by the clie=
nt.

Since his demise, even the members of his family haven't applied for
claims over this fund and it has been in the safe deposit account
until i discovered that it cannot be claimed since our client is a
foreign national and we are sure that he has no next of kin here to
file claims over the money. As the director of the department, this
discovery was brought to my office so as to decide what is to be done;
I decided to seek ways through which to transfer this money out of the
bank and out of the country too.

The total amount in the account is (18.6 million) with my positions as
a staff of this bank, i am handicapped because i cannot operate
foreign accounts and cannot lay benefice claim over this money. The
client was a foreign national and you will only be asked to act as his
next of kin and i will supply you with all the necessary information
and bank data to assist you in being able to transfer this money to
any bank of your choice where this money could be transferred into.

The total sum will be shared as follows: 50% for me, 50% for you, and
expenses incidental occur during the transfer will be incur by both of
us. The transfer is risk free on both sides hence you are going to
follow my instruction till the fund transfer to your account. Since I
work in this bank that is why you should be confident in the success
of this transaction because you will be updated with information=E2=80=99s =
as
at when desired.

I will wish you to keep this transaction secret and confidential as I
am hoping to retire with my share of this money at the end of
transaction which will be when this money is safety in your account. I
will then come over to your country for sharing according to the
previously agreed percentages. You might even have to advise me on
possibilities of investment in your country or elsewhere of our
choice. May god help you to help me to a restive retirement?

(1) Your full name..............
(2) Your age:................
(3) Sex:.....................
(4) Your telephone number:.................
(5) Your occupation:.....................
(6) Your country:.....................

Yours sincerely,
Dr Bryan Bouchet
