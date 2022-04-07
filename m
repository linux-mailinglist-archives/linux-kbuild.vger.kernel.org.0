Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D84D84F80A6
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Apr 2022 15:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbiDGNgL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Apr 2022 09:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343654AbiDGNgK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Apr 2022 09:36:10 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DB624E272
        for <linux-kbuild@vger.kernel.org>; Thu,  7 Apr 2022 06:34:09 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id s11so4896457pla.8
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Apr 2022 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=LecENqONxNDBAseFsv+yDhFyPls8aMa2Pn5px1MzNgs=;
        b=SNVQsECUOhAnMXWe+UjUMFAgdsqd7XUifjb4bfJYOLZnIKHBi4i8MdLoYD/VJN5npQ
         ctsVWpetAORfAvD7qB8u2UbugFjzvNsmGsw/T6yAhncEMsHFcsagKYtrBWv8ohdq33ab
         vLCxRcy9Kioj6o/JFfvgp61Sym2XdXCXyG/O90k5emR50NqxSfuIL6KkDkoEY1mF/YnN
         UVeNrY0mILt0tNCs0eggKzXS3PNaW4S1PCaIgtFS4awdgOWs9+fAVdgXb5kDxd4uTFLu
         UcjFWXIaXpsyY8HNt2FUPxsPBe0eUQqfKGpELLKCgvV/DqOo8Opv2L+WTLHsrQrfAHUV
         yZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=LecENqONxNDBAseFsv+yDhFyPls8aMa2Pn5px1MzNgs=;
        b=5VVbz/6EoO96bjvUyqP9gPboc6z2kmk4UAkRJfPaKxFZJhzPNqNsWJjd8L15PU8rPi
         JUtsP9+L3dLphIqbVFMF9sXXg3Sm1IOjdiyElLf5vdVVXpIwHGhfR/CeDk+23jqcIuo3
         rf2R6Y3wXny5oh9xYsRL3/vuXinVRD+7Bdtxwi525E4fUlLX/riSU+h0RKoCeRH7HIvF
         hllLQAk949jbR1m51IUJbFnLVo4TT0DlBXLqcL4tf0zkf53P3JDbwA7e01pwi9t3UNlB
         e8YGJpwme50NTwERXKq35qsIzcctf8c8lISwvL9D5d2gI9S2dWRcO4l9Uxhx2HNoVAun
         ZTkA==
X-Gm-Message-State: AOAM532IWQPYWUnWAtyojkfXcJ1+yTcR1lDr3TkAODqjY61/rq+vFjNr
        icF61PrbJTU04SnDOWLpQJLJyDTlDL9KVb0HaV8=
X-Google-Smtp-Source: ABdhPJztaQyJVTQQO0bplq/CjXZv6Kqhm68pusBvfnH3mv4EikoFL9nd6mhtZhdmhSLh4XApKqV5uVDdcxfM+79zWBs=
X-Received: by 2002:a17:902:ab01:b0:156:f1cc:6d2d with SMTP id
 ik1-20020a170902ab0100b00156f1cc6d2dmr6619175plb.127.1649338448953; Thu, 07
 Apr 2022 06:34:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:a01a:b0:7a:9fe0:c3c8 with HTTP; Thu, 7 Apr 2022
 06:34:08 -0700 (PDT)
Reply-To: anwarialima@gmail.com
From:   Alima Anwari <nadiazato3@gmail.com>
Date:   Thu, 7 Apr 2022 13:34:08 +0000
Message-ID: <CAM0zFyo5P_HRgkynMUqek7=2XDBHvMqoGPKw5xbErv5deE1tWA@mail.gmail.com>
Subject: God morgon
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--=20
Hej k=C3=A4ra v=C3=A4n, jag =C3=A4r Alima Anwari fr=C3=A5n Afghanistan, v=
=C3=A4nligen svara
tillbaka till mig och har ett br=C3=A5dskande problem att dela med dig. jag
kommer att v=C3=A4nta
f=C3=B6r din respons.
Tack.
Alima.
