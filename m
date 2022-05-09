Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D31D52034C
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 May 2022 19:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239034AbiEIRNH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 May 2022 13:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239460AbiEIRNF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 May 2022 13:13:05 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A341E3257
        for <linux-kbuild@vger.kernel.org>; Mon,  9 May 2022 10:09:11 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id w19so24939047lfu.11
        for <linux-kbuild@vger.kernel.org>; Mon, 09 May 2022 10:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qmNh/UlR00KzKm2embL/8KXGrDJlEF5LNSh8Qse0tHI=;
        b=XlxYVyti/+Q7NqrSdb22SAIl6Y2j55Yg5g2k37ctvzV1ktFvUd3+GBrrXaqN+9NFeY
         6EJHldsP4pwcrjQ2xzBRUlRSmr1Qray+IZ0Azb6pH9oGWAA6cH1MqKDYqSoobESAB3Tt
         eRGYGGgOM/icKjcAIArV0t0cRsOS98O3uc3oCmKTiATpvxAJt2dw7pFRGKnsUp5Fy6+q
         XIPCiWfYfE/TS6cBhvExSO/fG7/pxV+Gc6ing+pOzWL/ysqhEjHBgLIYNRnpXIBuNHwt
         4ZGKV+R/g8mxG2EAM+mfZqER4WmDuwtD4WjdICN3razEbRrdkjkeh/S/AOCAatbdqrDm
         dp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qmNh/UlR00KzKm2embL/8KXGrDJlEF5LNSh8Qse0tHI=;
        b=1da1mgP+U/lhPvr2jAtYVyCprGUe24XHCHpAzQ0sogbJZbrQGOCa9LTKMC4SKglegc
         g99JKEZKd9ye7kIaoi6xWjAY7WWw+6jgMVghx5tJXPF9rEFV7Yglq24rasl7Qk1Li1F+
         QEoYgITd20e0mXs+0j67O3mnwbDbszVkkl+ADocE1CZ7yCMtHCMmtFzGLBC33lXdnIV3
         NjhFValKSOBwCsex0QS/GYhw+X35iY90VriJzbkBT4hdUNVO7/qVF8cAplFxmrIis3DL
         h6tmMKbKIqizn2fvWNNvQBp3csNmRhnGKdL9e2C7734KuowhnWgLlgtCG48z+KWMlHxu
         LKMg==
X-Gm-Message-State: AOAM531m2oV7FFL797i4257okovv4CbTM6tdAUJ1ADxdEVDFav6W6C4l
        mh03LsV5Puu50Ntwmr41f1cz/YGxoP5LoY2yWhR4vM18dtE=
X-Google-Smtp-Source: ABdhPJwxw3I1e8oaAvfUjbq5Ev4Yd8NjV0buUyZoAzr7cbILcvl2TRmROPbsKEb/6HUIdbYLzAigXpP3dNIEtdsX6aE=
X-Received: by 2002:a05:6512:1d1:b0:471:f63a:b182 with SMTP id
 f17-20020a05651201d100b00471f63ab182mr13052968lfp.392.1652116149145; Mon, 09
 May 2022 10:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org> <20220508190631.2386038-2-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 May 2022 10:08:57 -0700
Message-ID: <CAKwvOdnawYY05Boy6FNUtBoi11z8yyMnfDzGUw0CDMT3vKuP5w@mail.gmail.com>
Subject: Re: [PATCH v4 01/14] modpost: remove left-over cross_compile declaration
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules@vger.kernel.org, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 8, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This is a remnant of commit 6543becf26ff ("mod/file2alias: make
> modalias generation safe for cross compiling").
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch! (I wonder if we should put our old mailing list
in .mailmap?)
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v4:
>   - New patch
>
>  scripts/mod/modpost.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index cfa127d2bb8f..d9daeff07b83 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -174,7 +174,6 @@ static inline unsigned int get_secindex(const struct elf_info *info,
>  }
>
>  /* file2alias.c */
> -extern unsigned int cross_build;
>  void handle_moddevtable(struct module *mod, struct elf_info *info,
>                         Elf_Sym *sym, const char *symname);
>  void add_moddevtable(struct buffer *buf, struct module *mod);
> --

-- 
Thanks,
~Nick Desaulniers
