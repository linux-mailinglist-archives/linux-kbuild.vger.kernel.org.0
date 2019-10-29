Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 917C2E8C44
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2019 16:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390194AbfJ2P6x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Oct 2019 11:58:53 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36955 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390192AbfJ2P6x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 11:58:53 -0400
Received: by mail-wm1-f66.google.com with SMTP id q130so2988800wme.2;
        Tue, 29 Oct 2019 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i0TUmJ18ZcyUKsXykls8PPcjqgJJsmsjfFdpRETWj3g=;
        b=REsfzx49IQKDe7LLT85vOXOTGHzt4JVWjq10YOQiyqqNLe9f1YEbVJWsx6JpnYmLIG
         mijUoxvAe4KCF6WNy1zGVD5IV+HKaQAKTlqoXFxqT/tCI3q7QBzGkchngGzzqMH6mwhV
         44g2wTN2J6cOVWe/dEvyVt5Jq4zl/iM/a56mlOCWAqOhvD6s8AlJXLoj/5SNBVvjh3iK
         9Y8Y4LJBA6rjWrvhCALVk5KUOLQPzU2a9G7ms3eD+WXOqfdabIy6lr/r4L+0bAYC/GYZ
         VOFtHTQMurlnROgtFGXhfHEpL2zBzBoFccIGFAIGxfkprNkqt7h54vtUFZljIFZi92MU
         C/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i0TUmJ18ZcyUKsXykls8PPcjqgJJsmsjfFdpRETWj3g=;
        b=EiyyYNilLC5eU7q8f2zSPtZ4p8W0GZPvAGjH37IXG1CAQkXqTth9lSteDO990sUzTx
         6bWkF+pfMSra6W6EvV3bFBWS67adgRzUkd15CKCHLMKgem0ll4VYy2/54Tp/br9acD7a
         t8RXCC6xLXxgx5rtuZGK+hZ2lV3lLRhPxgG1FeT+jMn3aK6e8f/nv5k5nGbUr1BR8a8X
         HQ0hvJs/JKksaZjban8uCZLD1ZrRQ7Qtjnu2SXDchHroYtbSpEDw5/FVOBZsasXkP8ix
         f95Kaii1KNy8KxssNBVxkW+gUsBuMtg49y9mjKLdQ19A5kKGVq3wc2PzADs6gqn2p/D6
         F6kQ==
X-Gm-Message-State: APjAAAVN8N/lVJbXniyQvggxQVInPNg2VovHUhTRzUW4r3ZzS+h4znLA
        6DQSh8+eeU4GJCRHwbrfL7Q=
X-Google-Smtp-Source: APXvYqwyZRhqa7Xzvm9LHS7ZHK+2KPi1arRJ8di0YaQGwNLNa7NPaxQrJ/SariJDIgjOWjG2f1Dlkw==
X-Received: by 2002:a7b:c0ca:: with SMTP id s10mr4696016wmh.166.1572364729523;
        Tue, 29 Oct 2019 08:58:49 -0700 (PDT)
Received: from [172.20.38.115] ([91.217.168.176])
        by smtp.gmail.com with ESMTPSA id m3sm3155307wrb.67.2019.10.29.08.58.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Oct 2019 08:58:49 -0700 (PDT)
Subject: Re: [PATCH v2] kbuild: support byacc as alternative YACC to bison
To:     Ethan Sommer <e5ten.arch@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <CAK7LNASG4GzaU6SR=ThfJpjrqmC53xmcSMAWqppciWbx3jMgdw@mail.gmail.com>
 <20191029150119.19823-1-e5ten.arch@gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <760b5b4f-caa6-67e1-aa7f-ddd694a84b4a@gmail.com>
Date:   Tue, 29 Oct 2019 10:58:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029150119.19823-1-e5ten.arch@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Ethan,

On 10/29/19 10:01 AM, Ethan Sommer wrote:
> Switches to a more portable set of flags for generating the same file
> names instead of the bison-specific --defines, uses the more portable -V
> instead of --version, and explicitly defines YYSTYPE in lex.l, which
> bison implicitly defines if not present but byacc does not.
> 
> Add %locations to dtc-parser.y to explicitly enable location tracking
> for byacc, and define YYERROR_CALL explicitly to prevent the locations
> directive from causing it to be defined to a 2-parameter call to
> yyerror, which dtc-parser.y defines to accept one parameter.
> 
> Requires byacc to be built with --enable-btyacc.
> 
> Signed-off-by: Ethan Sommer <e5ten.arch@gmail.com>
> ---
>  scripts/Makefile.host     | 2 +-
>  scripts/dtc/dtc-parser.y  | 4 ++++
>  scripts/genksyms/Makefile | 2 +-
>  scripts/genksyms/lex.l    | 2 ++
>  4 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index 4c51c95d40f4..64e98e1d4825 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -11,7 +11,7 @@ $(obj)/%.lex.c: $(src)/%.l FORCE
>  # YACC
>  # ---------------------------------------------------------------------------
>  quiet_cmd_bison = YACC    $(basename $@).[ch]
> -      cmd_bison = $(YACC) -o $(basename $@).c --defines=$(basename $@).h -t -l $<
> +      cmd_bison = $(YACC) -b $(basename $(basename $@)) -d -t -l $<
>  
>  $(obj)/%.tab.c $(obj)/%.tab.h: $(src)/%.y FORCE
>  	$(call if_changed,bison)
> diff --git a/scripts/dtc/dtc-parser.y b/scripts/dtc/dtc-parser.y
> index 2ed4dc1f07fd..40dcf4f149da 100644
> --- a/scripts/dtc/dtc-parser.y
> +++ b/scripts/dtc/dtc-parser.y

For file scripts/dtc/dtc-parser.y:

This file is maintained in the upstream dtc project.  We pull changes
from that project into the Linux kernel source tree.

The file is located at the root level of the upstream project.

Info on submitting patches is in the upstream file "Documentation/manual.txt":

   1) Sources

   Source code for the Device Tree Compiler can be found at git.kernel.org.

   The upstream repository is here:

       git://git.kernel.org/pub/scm/utils/dtc/dtc.git
       https://git.kernel.org/pub/scm/utils/dtc/dtc.git

   The gitweb interface for the upstream respository is:

       https://git.kernel.org/cgit/utils/dtc/dtc.git/

   1.1) Submitting Patches

   Patches should be sent to the maintainers:
           David Gibson <david@gibson.dropbear.id.au>
           Jon Loeliger <jdl@jdl.com>
   and CCed to <devicetree-compiler@vger.kernel.org>.

-Frank


> @@ -2,6 +2,8 @@
>  /*
>   * (C) Copyright David Gibson <dwg@au1.ibm.com>, IBM Corporation.  2005.
>   */
> +%locations
> +
>  %{
>  #include <stdio.h>
>  #include <inttypes.h>
> @@ -17,6 +19,8 @@ extern void yyerror(char const *s);
>  		treesource_error = true; \
>  	} while (0)
>  
> +#define YYERROR_CALL(msg) yyerror(msg)
> +
>  extern struct dt_info *parser_output;
>  extern bool treesource_error;
>  %}
> diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
> index 78629f515e78..397c2dc8182b 100644
> --- a/scripts/genksyms/Makefile
> +++ b/scripts/genksyms/Makefile
> @@ -15,7 +15,7 @@ genksyms-objs	:= genksyms.o parse.tab.o lex.lex.o
>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>  
>  quiet_cmd_bison_no_warn = $(quiet_cmd_bison)
> -      cmd_bison_no_warn = $(YACC) --version >/dev/null; \
> +      cmd_bison_no_warn = $(YACC) -V >/dev/null; \
>  			  $(cmd_bison) 2>/dev/null
>  
>  $(obj)/pars%.tab.c $(obj)/pars%.tab.h: $(src)/pars%.y FORCE
> diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
> index e265c5d96861..0580c088527f 100644
> --- a/scripts/genksyms/lex.l
> +++ b/scripts/genksyms/lex.l
> @@ -19,6 +19,8 @@
>  #include "genksyms.h"
>  #include "parse.tab.h"
>  
> +extern YYSTYPE yylval;
> +
>  /* We've got a two-level lexer here.  We let flex do basic tokenization
>     and then we categorize those basic tokens in the second stage.  */
>  #define YY_DECL		static int yylex1(void)
> 

