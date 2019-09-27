Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96108C04D3
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2019 14:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfI0MHc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 08:07:32 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33061 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbfI0MHc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 08:07:32 -0400
Received: by mail-wm1-f66.google.com with SMTP id r17so8832702wme.0
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Sep 2019 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=84xRwRrZmOOdIxdbCFs/76XVQL6uDCBjiwfidtG4ZYM=;
        b=WoDuTDJ51YpWy/YTLe3hqO+KzOYNYKoW0+q9q0OQPcU/aio9PtBbBoWCF1YqMtaj8V
         hQiEBkcuJfUEWV9pQVH06ZHV7IMIdYEJjDjNpLIwovn1xGmBPYx28ZMVXqzdcFKP3qSx
         J8XLZ4S/fFMX5VTG31hnjH+1EVtwz7RURg3WoD/AM6d7jsl+ogW2pkKL9LbMiBGKfWfq
         3fjMjHu7gRcz1wr5aWPUMYMpBBI/XPmBoDQlBPKFwc2dAF5c/AES00tYXRRqeWmfwSqg
         5HOIpn+WjiDQkdDSzuVxPnh0N8DxuR33WREM2SdLMjejLeWaTloir5hs6sgS2uQ6mRFQ
         eYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=84xRwRrZmOOdIxdbCFs/76XVQL6uDCBjiwfidtG4ZYM=;
        b=PsY0FATtrvC+mT1hbIOu8vlQKLg/4iuRwJnFBgQpE8AjqhOnZGz+/WSFQ2PYhtXTPq
         gAhbr22SSW2sG2cRMADo8tRzjbEGK/GP/lS8cCX1nOsshH0UY62LSmuqxxXUnQuW6Tra
         RlbgQD69TSxQaSX4aLiTTVcY2ngBvoOSVrqyWXbS14cjLmeVb3oRpvMmp5gNsZS6H7nU
         Mzb0RIYk//gpNs6kayyH1aIbmy1M1MdcTSPsiYKSmk9gb5YJIWh7NbugnSvafQECxBLY
         9hgtpJEyg0Cb0TAQfVw/OH4GSWjs98aM0dEhgz4JbwXbZHcWOhoyr+t/yFltXC5+Rxj9
         ymAA==
X-Gm-Message-State: APjAAAVnMXngg36as9vQJOtVDZL4KOztMDgT5dtECpzVj7ekn0qg6kmT
        xwIHcFrBwQemkH2EnnF498/AxA==
X-Google-Smtp-Source: APXvYqyl4i/x7HZQ30O6mlu2aXxv7XYbP6Z+aw4pLYSgDuPMZfoBLL2hyS3M3I2UZrJt6GKFDNdq3g==
X-Received: by 2002:a05:600c:34e:: with SMTP id u14mr6416482wmd.110.1569586050030;
        Fri, 27 Sep 2019 05:07:30 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id a14sm7174519wmm.44.2019.09.27.05.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 05:07:28 -0700 (PDT)
Date:   Fri, 27 Sep 2019 13:07:25 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Martijn Coenen <maco@android.com>,
        Will Deacon <will.deacon@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] module: swap the order of symbol.namespace
Message-ID: <20190927120725.GB259443@google.com>
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
 <20190927093603.9140-3-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190927093603.9140-3-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 27, 2019 at 06:35:58PM +0900, Masahiro Yamada wrote:
>Currently, EXPORT_SYMBOL_NS(_GPL) constructs the kernel symbol as
>follows:
>
>  __ksymtab_SYMBOL.NAMESPACE
>
>The sym_extract_namespace() in modpost allocates memory for the part
>SYMBOL.NAMESPACE when '.' is contained. One problem is that the pointer
>returned by strdup() is lost because the symbol name will be copied to
>malloc'ed memory by alloc_symbol(). No one will keep track of the
>pointer of strdup'ed memory.
>
>sym->namespace still points to the NAMESPACE part. So, if you like,
>you can free it with complicated code like this:
>
>   free(sym->namespace - strlen(sym->name) - 1);
>
>I would not say it is fatal since we seldom bother to manually free
>memory in host programs. But, I can fix it in an elegant way.
>
>I swapped the order of the symbol and the namespace as follows:
>
>  __ksymtab_NAMESPACE.SYMBOL
>
>then, simplified sym_extract_namespace() so that it allocates memory
>only for the NAMESPACE part.
>
>I prefer this order because it is intuitive and also matches to major
>languages. For example, NAMESPACE::NAME in C++, MODULE.NAME in Python.

I agree with this rationale and like the implementation. I believe the
idea of appending the namespace came from being afraid of other tools
facing the problem of parsing the namespace out of the middle of the
entry. Thanks for this improvement.

Reviewed-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

>Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>---
>
> include/linux/export.h |  4 ++--
> scripts/mod/modpost.c  | 16 +++++++---------
> 2 files changed, 9 insertions(+), 11 deletions(-)
>
>diff --git a/include/linux/export.h b/include/linux/export.h
>index 95f55b7f83a0..0695d4e847d9 100644
>--- a/include/linux/export.h
>+++ b/include/linux/export.h
>@@ -52,7 +52,7 @@ extern struct module __this_module;
> 	__ADDRESSABLE(sym)						\
> 	asm("	.section \"___ksymtab" sec "+" #sym "\", \"a\"	\n"	\
> 	    "	.balign	4					\n"	\
>-	    "__ksymtab_" #sym NS_SEPARATOR #ns ":		\n"	\
>+	    "__ksymtab_" #ns NS_SEPARATOR #sym ":		\n"	\
> 	    "	.long	" #sym "- .				\n"	\
> 	    "	.long	__kstrtab_" #sym "- .			\n"	\
> 	    "	.long	__kstrtab_ns_" #sym "- .		\n"	\
>@@ -76,7 +76,7 @@ struct kernel_symbol {
> #else
> #define __KSYMTAB_ENTRY_NS(sym, sec, ns)				\
> 	static const struct kernel_symbol __ksymtab_##sym##__##ns	\
>-	asm("__ksymtab_" #sym NS_SEPARATOR #ns)				\
>+	asm("__ksymtab_" #ns NS_SEPARATOR #sym)				\
> 	__attribute__((section("___ksymtab" sec "+" #sym), used))	\
> 	__aligned(sizeof(void *))					\
> 	= { (unsigned long)&sym, __kstrtab_##sym, __kstrtab_ns_##sym }
>diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>index 5c628a7d80f7..d171b0cffb05 100644
>--- a/scripts/mod/modpost.c
>+++ b/scripts/mod/modpost.c
>@@ -350,18 +350,16 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
>
> static const char *sym_extract_namespace(const char **symname)
> {
>-	size_t n;
>-	char *dupsymname;
>+	char *namespace = NULL;
>+	char *ns_separator;
>
>-	n = strcspn(*symname, ".");
>-	if (n < strlen(*symname) - 1) {
>-		dupsymname = NOFAIL(strdup(*symname));
>-		dupsymname[n] = '\0';
>-		*symname = dupsymname;
>-		return dupsymname + n + 1;
>+	ns_separator = strchr(*symname, '.');
>+	if (ns_separator) {
>+		namespace = NOFAIL(strndup(*symname, ns_separator - *symname));
>+		*symname = ns_separator + 1;
> 	}
>
>-	return NULL;
>+	return namespace;
> }
>
> /**
>-- 
>2.17.1
>
