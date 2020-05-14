Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE78D1D4144
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2020 00:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbgENWnh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 May 2020 18:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728229AbgENWng (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 May 2020 18:43:36 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8492C061A0C;
        Thu, 14 May 2020 15:43:36 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t40so96301pjb.3;
        Thu, 14 May 2020 15:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=z4rDFOjoDHp3m5X99/G3ebYd8yR50/aoIzPUOG1GLcs=;
        b=vgRWK6jHB5dSs0OdLSkzBqWuiOcjVqUf7U1pq6WxzFS3AOr5DsU09OluLm/WYODRdo
         Y+VoaK5bpdEauvoXop/3xWI7mt45dPeGuwJD+SExWfMpWiMISoVtilmlf33/WsdFmWYr
         VB15Dh099Z/elzl5Emo2PhsygoVhSv/3P380nkgzx4lWvXoBtVV2E12WmnHBMV1gQRKd
         iFr5Leb36weuTSM8CE3BsKHS7WD2t4e8qT6z2y/tBZT2kU9LT7HONV6XTlf/EaeysXd9
         xk8mdtxY2o0+d8KjRmdgRJ1Kde6x67LMfkVIE4IJEChyaV6q20t3JJ8XZm8wF9r6aGfz
         gy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=z4rDFOjoDHp3m5X99/G3ebYd8yR50/aoIzPUOG1GLcs=;
        b=dmz7LbtliO8pw7N4fwQgE9uP9Fn2abaEo4NTiV6KvRfX8UTB8IWxI4e+APcji/n+H1
         xGgeyic0O1j60Hfm55TfUCxan6rMJx19RkU6x451PwYF4ZX0S0VbT4ML4tvzuuIwPyyF
         RftnP1S1PPdk09ebkA7SmdzUjcmw4JGr7Gnd31n0xRXMq0PtQhpebPQKMYEa5bzbtYQ7
         wafAijLmFLPMXkPmT5BRiyZ5T4i/bIzrwIZBtknzE57tdCxP9fEsbd2X6L/IXmJ9MG41
         WJSzJpAQr97cMCzhIHk+hy1eACsFAdRg66XoZMQOpG+Foj5c9HwmQlkvUY5tL4/+CHaa
         iBGQ==
X-Gm-Message-State: AOAM530E8s58pwB2qAnOgOdiOgOjjBXSDnI1+eUDp0jzW2tyozaEAwLz
        e6kUcuWTF+nLlTnTFYjeUbToCapuPNE=
X-Google-Smtp-Source: ABdhPJxRdYS3RxsROzFtMgICDF2TbSfVVVKzTQX7K+Ozr1D8pgvkYTedmXkVgF4ITFfBsxskIhpYbQ==
X-Received: by 2002:a17:90a:cb09:: with SMTP id z9mr264097pjt.120.1589496216213;
        Thu, 14 May 2020 15:43:36 -0700 (PDT)
Received: from localhost (cpc158779-hari22-2-0-cust230.20-2.cable.virginm.net. [86.22.86.231])
        by smtp.gmail.com with ESMTPSA id mn1sm69221pjb.24.2020.05.14.15.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 15:43:35 -0700 (PDT)
From:   Yuxuan Shui <yshuiv7@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH] kbuild: compile_h: fix compiler version detection with clang
Date:   Thu, 14 May 2020 23:19:05 +0100
Message-ID: <87imgykunh.fsf@m5Zedd9JOGzJrf0>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--=-=-=
Content-Type: text/plain


In some setup clang will print a line about CUDA version it detects,
like this:

    Found CUDA installation: /opt/cuda, version 10.1

So grepping ' version ' matches 2 lines, and results in a broken string in
compiler.h, which doesn't compile.

This commit adds a "head -n1" to fix this problem.

Signed-off-by: Yuxuan Shui <yshuiv7@gmail.com>
---
 scripts/mkcompile_h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 5b80a4699740..8e6b4fc6fdd9 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -62,7 +62,7 @@ UTS_VERSION="$(echo $UTS_VERSION $CONFIG_FLAGS $TIMESTAMP | cut -b -$UTS_LEN)"
   printf '#define LINUX_COMPILE_BY "%s"\n' "$LINUX_COMPILE_BY"
   echo \#define LINUX_COMPILE_HOST \"$LINUX_COMPILE_HOST\"

-  CC_VERSION=$($CC -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$//')
+  CC_VERSION=$($CC -v 2>&1 | grep ' version ' | head -n1 | sed 's/[[:space:]]*$//')
   LD_VERSION=$($LD -v | head -n1 | sed 's/(compatible with [^)]*)//' \
 		      | sed 's/[[:space:]]*$//')
   printf '#define LINUX_COMPILER "%s"\n' "$CC_VERSION, $LD_VERSION"
--
2.26.2

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEL6EJkr0WlitWahBy06RAW+bMF/QFAl69yYwACgkQ06RAW+bM
F/QVYA/+Iqa09i83Gi0bUr1ZSpujLj3Pke7A3qzGr1WxDx+WgeUsN466dtbmo3x3
Gvxocu+lzO2fhJuG8/Lk3DcNUrpBaxi/qfTq5SXK0IMQmAbhIQRVVQw8Vz+C9nuk
IatyTz5sgaBpVZlQzOs81bcfcF3Q1jlP57okNbZLIkhDk74seIRFddiY3gR3TNb1
3VUQDmoPT7Xo0N7whzERmfzCPlrWZphDT8nh6OwOt/InJJPvB1i8235ckCZbhIty
KFYH1nxB19QkURZ12zGxmnHJeGEXTc+Yy/NcpNH/lA1h2IvcD9qmE/E1TBoueiPy
MrgxczwhPgjhzeNv0AwSK0JhjWEDl3Jg2GXNhngIckfn+DrEZN4WreF5fNZNctqs
4+GOKreqGvJqXL9hUF6Pjwv/ef4zi3Py2qkJEQRxATPEf8Kk8t2Ok/Xkf+e0uRCL
tWVlCbHtkotEjycImzNbyRGoquIfIamuidtq+k5Bs0OIGUETVK6hEng45F2PQ27E
YHo7SXKDeQjrHHr/05ues02xecf0JRhvn/vBr8E/uddXAPEgYn25P7N5Al4KpMiV
U7TlikB/r6V8IUfQjqki9qGaPmMGp790QNQwx/jR8hOPZ5aBN57qTcRM/NSs4vgl
RFTwHAK9KrWpRsrU9E9s9BWXgGdTwKOjzAZpLX0jygr2iJXVjP4=
=WfVw
-----END PGP SIGNATURE-----
--=-=-=--
