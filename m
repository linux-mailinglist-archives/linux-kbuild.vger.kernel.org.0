Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF5A7C7D23
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Oct 2023 07:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjJMFoU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Oct 2023 01:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjJMFoT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Oct 2023 01:44:19 -0400
Received: from correo1.cdmx.gob.mx (mtax.cdmx.gob.mx [189.240.235.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C0EBC
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Oct 2023 22:44:17 -0700 (PDT)
Received: from cdmx.gob.mx ([10.250.108.150])
        by correo1.cdmx.gob.mx  with ESMTP id 39D5b5Iu029850-39D5b5Iw029850
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 12 Oct 2023 23:37:05 -0600
Received: from cdmx.gob.mx (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTPS id C31322483C5;
        Thu, 12 Oct 2023 18:46:58 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id D71102483BC;
        Thu, 12 Oct 2023 18:46:54 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 cdmx.gob.mx D71102483BC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=cdmx.gob.mx; s=DKIM1; c=relaxed/relaxed;
 h=content-type:mime-version:subject:to:from:date:reply-to:message-id;
 bh=rbYcnCareEGc9DQgqcyAJTBPPk6/3d1IGHnlf47tJEI=;
 b=ls1ibPv0HcAq/dnTNyzSh5okcwXNerZ0XjFtb2GpjGhmn3f3MaqOwLSdIpSDqJqFRnOF/wn31CK9
        GDRILjAITiESilsCN4UWEJ+ilpXkGg4WESfgstCtPHVbgTfXlYkSzMeJRNyoJh+xo8nf7+BitLvN
        2JjmtYI755U2ks7ZnIjkR5TzjcS26v3CYhIVnLgidJ8gPko0qvxyjNxcvM3svd1dItQxTJ1vH4hQ
        Yj4feCdaOgTSk6mM2ZA7xs7MnZ7dZWOqr7qPdcOVoHuFAS+J2pCW8Fw9DVvvO7xR4zIohDv72EwR
        +Xbo5RuzoLG0T7+gGJo0xFLlBLjgjvuPE/odSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cdmx.gob.mx;
        s=2020J4N146MXCTY; t=1697154414;
        bh=R2wviz4IWmGSYPcexBmjsPLV4xkbt9QJD4bg8fJFTP8=;
        h=Content-Type:MIME-Version:Subject:To:From:Date:Reply-To:
         Message-Id;
        b=P5LGnA0Hf28SJGq2QiJB/k+NsuFD17DKZ28SMIqRTUjaUdGeftD1+MSMazIAE5m5l
         /Pg/DzbzirWwuJvllQu+Qp3dlrwMFRL3rMawZ25ul9vnxqnhvNR7XykkqAoQFNdQrs
         8FWTg2pbBB0fMXicnmuj2c+ux1HekxgX9XdofzZY=
X-Virus-Scanned: amavisd-new at cdmx.gob.mx
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id uY-L8aBnAixF; Thu, 12 Oct 2023 18:46:54 -0500 (CDT)
Received: from [192.168.8.123] (unknown [179.61.245.12])
        by cdmx.gob.mx (Postfix) with ESMTPSA id 8E825246725;
        Thu, 12 Oct 2023 18:44:08 -0500 (CDT)
Content-Type: multipart/alternative; boundary="===============0994775564=="
MIME-Version: 1.0
Subject: $4.8 million dollars.
To:     Recipients <ctrinidad@cdmx.gob.mx>
From:   "Mr. Dennis Banfield" <ctrinidad@cdmx.gob.mx>
Date:   Thu, 12 Oct 2023 17:44:32 -0700
Reply-To: dbanfielddonation@gmail.com
Message-Id: <20231012234409.8E825246725@cdmx.gob.mx>
X-Spam-Status: Yes, score=7.0 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        HK_NAME_MR_MRS,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,SUBJ_DOLLARS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [189.240.235.197 listed in list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6062]
        *  0.1 SUBJ_DOLLARS Subject starts with dollar amount
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.0 HK_NAME_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.5 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

You will not see this in a MIME-aware mail reader.
--===============0994775564==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body

I have a donation of $4,800,000.00 dollars for you, I won the UK lottery Po=
werball jackpot and I donated a part of it to charities. kindly contact me =
for your donation via (dbanfielddonation@gmail.com) for your claim.
--===============0994775564==
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body

I have a donation of $4,800,000.00 dollars for you, I won the UK lottery =
Powerball jackpot and I donated a part of it to charities. kindly contact=
 me for your donation via (dbanfielddonation@gmail.com)) for your claim.

--===============0994775564==--
