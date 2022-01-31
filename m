Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B7E4A4131
	for <lists+linux-kbuild@lfdr.de>; Mon, 31 Jan 2022 12:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbiAaLDS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 31 Jan 2022 06:03:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358760AbiAaLBT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Jan 2022 06:01:19 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821ACC0613A2
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Jan 2022 03:00:08 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id o10so11059753ilh.0
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Jan 2022 03:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=FANIUiWvB3mdY3zLX2DODg2pUIL5eGT5wlydl6jYk40=;
        b=Ozk//2swZ4n+9EW8l8AJE1MTLlpoaCXK3xzfpPFLIseBsOa2jBlUIXPufJKZWOZJb1
         LZYSIA+qJrwb7cNfMphudC5bBa0wGV8S3gL6kVVbqGkOdt0B4XP1yUbpKkdrSgOk4SCw
         v1C0S0LKRkjJnU7f896SEI1wlEalwFx9Rgq5irerJa96uqZolG/hVsfTboEhp5Wo262X
         Bw5DjIfp6f3BMZuUcN/21CQmX+e0cBVKV6O17yhSY33CkiO9iN1/rQChZ0P/9curfp6q
         4Ae69srjWBiOD2IQLksGh38ZmWapdFwCTJxNZE6Fdwc1T0xvGWym84r63rPu354BmJN+
         Mxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=FANIUiWvB3mdY3zLX2DODg2pUIL5eGT5wlydl6jYk40=;
        b=KOlS0fMByyVcom1K36gd39wG3o+LIraLjy2pMjfcqAFwWFNjq5t5LKU2rdz6t2kUMY
         J69k7QCc+e4g4syopWStkSfFgiX15oXarQwsrq2OEcDloL4iZ5qQSp/462mjmzD5cM7W
         Dge2VyakhK7R780Kvj0J0dPnUqf4oQeXrhZ4FBhoQhFO7tE58dKwNZ1DPWChCh+WWpxD
         rLA09kSzhJ9kaFE9InQhxPkEl1G7AepAU+gyUIYfd2QjEZ+FoETJB+42qmM8fWLcy3wR
         kK4uOW2zR/DLLFw6a0gMAAbHQDLx+fhjA0MOrfgARfd2wBF7UtG/n1G1tfO6b/8oaJdX
         56XQ==
X-Gm-Message-State: AOAM531d/0jNnhfYXnho8ysKd+Cmov/6mk8zt6pqQzMCVTbEOcKDjygF
        9u/ulh0464QnscY19LZAWeac4SIIP27uOFnBs/M=
X-Google-Smtp-Source: ABdhPJwTER/p0YcvOwwJid91RzPvkEw8DmHtUlVRny5nV0kksgWcR6ScIqwhpLtpjii0MFHZVgmhnLw6wJn43CXNw30=
X-Received: by 2002:a92:ca4f:: with SMTP id q15mr10723189ilo.181.1643626807913;
 Mon, 31 Jan 2022 03:00:07 -0800 (PST)
MIME-Version: 1.0
Reply-To: daniellakyle60@gmail.com
Sender: drdanielmorris11111@gmail.com
Received: by 2002:a05:6638:1248:0:0:0:0 with HTTP; Mon, 31 Jan 2022 03:00:07
 -0800 (PST)
From:   Mrs daniell akyle <daniellakyle60@gmail.com>
Date:   Mon, 31 Jan 2022 12:00:07 +0100
X-Google-Sender-Auth: juhwXopT4FowK4J6T8rApuMl0w4
Message-ID: <CAKFcj-OsHQc6b32Puiy4zbkpRh0TFP-Vu0BdoENoHiCXtxRwQQ@mail.gmail.com>
Subject: Ahoj
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Pozdravy
Jmenuji se pan=C3=AD Daniella Kyleov=C3=A1, je mi 58 let
Filip=C3=ADny. V sou=C4=8Dasn=C3=A9 dob=C4=9B jsem hospitalizov=C3=A1n na F=
ilip=C3=ADn=C3=A1ch, kde jsem
podstupuje l=C3=A9=C4=8Dbu akutn=C3=ADho karcinomu j=C3=ADcnu. jsem um=C3=
=ADraj=C3=ADc=C3=AD,
vdova, kter=C3=A1 se rozhodla darovat =C4=8D=C3=A1st sv=C3=A9ho majetku spo=
lehliv=C3=A9 osob=C4=9B
kter=C3=A1 tyto pen=C3=ADze pou=C5=BEije na pomoc chud=C3=BDm a m=C3=A9n=C4=
=9B privilegovan=C3=BDm. Chci
poskytnout dar ve v=C3=BD=C5=A1i 3 700 000 =C2=A3 na sirotky nebo charitati=
vn=C3=AD organizace
ve va=C5=A1=C3=AD oblasti. Zvl=C3=A1dne=C5=A1 to? Pokud jste ochotni tuto n=
ab=C3=ADdku p=C5=99ijmout
a ud=C4=9Blejte p=C5=99esn=C4=9B tak, jak v=C3=A1m =C5=99=C3=ADk=C3=A1m, pa=
k se mi vra=C5=A5te pro dal=C5=A1=C3=AD vysv=C4=9Btlen=C3=AD.
pozdravy
Pan=C3=AD Daniella Kyleov=C3=A1
