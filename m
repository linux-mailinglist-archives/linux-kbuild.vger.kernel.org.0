Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633E02E18DF
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Dec 2020 07:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgLWGYK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Dec 2020 01:24:10 -0500
Received: from mail-pf1-f179.google.com ([209.85.210.179]:35703 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbgLWGYJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Dec 2020 01:24:09 -0500
Received: by mail-pf1-f179.google.com with SMTP id c79so9810475pfc.2
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Dec 2020 22:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=G6PAn0r+/IzdjMqkuz9VYDbpRXmt97eL65kFykDWS6U=;
        b=X7evzBTEE+/xCDyvinaVgMVVKwGpomKnvGmlvgKpk8fllJYVqie0EFQZravyXD5P7P
         ac1UPQVM+PJjtlrfdR7T0egpEHRCBHVcx5XH11dHX5apEW0hWQ7tWTtuYmkXjD/WHmyU
         IElyJZcxsDBp0/Pwm/QqsxGwGEscJp2DgwPqJupGeI24mmzMDZm7IbKoVEAWj6kHAMfy
         oc7v+mzS4A/QOgcPdNP5rfiykWirVsqrQIY5AS989PWK7TdDD5KMysD8ocMMBAs5swkt
         l2GLf76tOEeIV0MyL+dWN6XXL+uE/hAWbsi5/rUvTlp/s2yXKLYsKO+XM7C8773Nyj/4
         9eUw==
X-Gm-Message-State: AOAM53360ZS9xMkR3PS4Wufr+Dt9kRSKj+Iyn8A5KZn1o2xJkfug8HLP
        AcGHCF3P4wBDQqt6vIRWK93+wwqMdboEQ7gH
X-Google-Smtp-Source: ABdhPJzHVXKRVJpgF8hmGlRZd4wCLjzvnqGOcqv2KWL54hAjOSgUc54h2KEkbULXqtjOjNvtKVdXrA==
X-Received: by 2002:a63:3247:: with SMTP id y68mr23423875pgy.10.1608704608767;
        Tue, 22 Dec 2020 22:23:28 -0800 (PST)
Received: from macbook.local (ae142046.dynamic.ppp.asahi-net.or.jp. [14.3.142.46])
        by smtp.gmail.com with ESMTPSA id c18sm19896423pfj.200.2020.12.22.22.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 22:23:28 -0800 (PST)
Subject: [PATCH v2] lib/raid6: Let $(UNROLL) rules work with macOS userland
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <CAL1ky9r9FutN2baRhV_WO-stV1FHKq-par4uv-VfCdofcGhSVg@mail.gmail.com>
 <CAK7LNAQRa18QWQep=Tj9Due_TvAotD4_v0GX83yP0SKX=jUQSQ@mail.gmail.com>
 <CAL1ky9orK39qmvPPk05SoUHWByTwL-kSkgTsbZEvh1vUR4+hXw@mail.gmail.com>
 <CAK7LNARnoU6GFCxNTEzOqj1J2hYZVNJKTtEb81b_VtRz6jswiQ@mail.gmail.com>
From:   John Millikin <john@john-millikin.com>
Message-ID: <60f12be3-2f7f-8c7c-55dc-f360ff959fe0@john-millikin.com>
Date:   Wed, 23 Dec 2020 15:23:25 +0900
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNARnoU6GFCxNTEzOqj1J2hYZVNJKTtEb81b_VtRz6jswiQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Older versions of BSD awk are fussy about the order of '-v' and '-f'
flags, and require a space after the flag name. This causes build
failures on platforms with an old awk, such as macOS and NetBSD.

Since GNU awk and modern versions of BSD awk (distributed with
FreeBSD/OpenBSD) are fine with either form, the definition of
'cmd_unroll' can be trivially tweaked to let the lib/raid6 Makefile
work with both old and new awk flag dialects.

Signed-off-by: John Millikin <john@john-millikin.com>
---
Changes in v2:
  - Updated the patch description to note that only older versions of
    awk (as found in macOS and NetBSD) need this patch to work.

 lib/raid6/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index b4c0df6d706d..c770570bfe4f 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -48,7 +48,7 @@ endif
 endif
 
 quiet_cmd_unroll = UNROLL  $@
-      cmd_unroll = $(AWK) -f$(srctree)/$(src)/unroll.awk -vN=$* < $< > $@
+      cmd_unroll = $(AWK) -v N=$* -f $(srctree)/$(src)/unroll.awk < $< > $@
 
 targets += int1.c int2.c int4.c int8.c int16.c int32.c
 $(obj)/int%.c: $(src)/int.uc $(src)/unroll.awk FORCE
-- 

