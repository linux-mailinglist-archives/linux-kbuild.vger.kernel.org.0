Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 612EA733D28
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Jun 2023 02:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjFQA2s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Jun 2023 20:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjFQA2r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Jun 2023 20:28:47 -0400
Received: from out-25.mta1.migadu.com (out-25.mta1.migadu.com [95.215.58.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5B63A89
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Jun 2023 17:28:45 -0700 (PDT)
Date:   Fri, 16 Jun 2023 20:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686961721;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oaftPGbxTf99h6Fvwz7OHzGqbqcVrb1RXHFkd6rrmXw=;
        b=fKlV+AGxmu+h/W/Jn5jJBFeL1MLg45etldxQesWiJCJjkmwcvZ/279GGwUifwYEm8YOsQ+
        G+4PnSiB0sJvS6QSrEUisjT4ITOZ1S6UkkKRnqM/BSx/WvvZ7I3KIYetv0RA2KBuSz80S0
        1MDcFoDvsk23gNfCIdiqkB9+S+B6l4E=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Peter Oberparleiter <oberpar@linux.ibm.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: Specifying CFLAGS for a directory on the command line
Message-ID: <ZIz+NFzAnyAKmV9u@moria.home.lan>
References: <ZIOmUkXlegycIExQ@moria.home.lan>
 <CAKwvOdneu4Fzy+x1KTd_ugLzt4iyUpE+fGXwXeNCWW12Jtj1GA@mail.gmail.com>
 <CAKwvOdnuPYKahsgAA=n6MD+byxujaEW82FEUWd2Ay4Tx9VAiDw@mail.gmail.com>
 <ZIO3leNyqOeJw6u3@moria.home.lan>
 <bddaf556-6417-ffaf-2301-9caf47089b21@linux.ibm.com>
 <ZIiz4WjIB6r8Gz4l@moria.home.lan>
 <a077ce91-1cfc-5c15-aa0e-1cf90f71e719@linux.ibm.com>
 <ZIwDIOxq3rE/8QUV@moria.home.lan>
 <c45f6e75-da4e-e496-e3c4-4fdfea29104a@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c45f6e75-da4e-e496-e3c4-4fdfea29104a@linux.ibm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 16, 2023 at 08:10:44PM +0200, Peter Oberparleiter wrote:
> Not that I know of. Here's how it could be made to work using Makefile
> magic alone (as a pure programming exercise :)
> 
> This will expand a directory to a list of all parent directories:
> 
> # expand_parents(a/b/c) = a/b/c a/b a
> expand_parents2 = $(if $(subst .,,$(1)),$(call expand_parents,$(1)),)
> expand_parents  = $(1) $(call expand_parents2,$(patsubst %/,%,$(dir $(1))))
> 
> This list could then be turned into variable suffixes:
> 
> # flatten_dirs(a/b/c) = a_b_c a_b a
> flatten_dirs = $(subst /,_,$(call expand_parents,$(1)))
> 
> And finally the resulting list of suffixed variables could be evaluated:
> 
> # eval_vars(X_,a/b/c) = $(X_a_b_c) $(X_a_b) $(X_a)
> eval_vars = $(foreach var,$(call flatten_dirs,$(2)),$($(1)$(var)))
> 
> So a call like this
> 
> $(call eval_vars,GCOV_PROFILE_,a/b/c)

I just hooked it up and it works perfectly - I owe you a beer :)

> would evaluate to the concatenation of the contents of the following
> variables:
> 
> GCOV_PROFILE_a_b_c
> GCOV_PROFILE_a_b
> GCOV_PROFILE_a
> 
> The first non-empty variable would then determine whether profiling
> should be enabled for the associated source file or not. This would even
> implement the correct order of precedence (specific to generic)
> 
> Not sure if this amount of magic is suitable for kbuild though. An
> alternative, less complex approach would be to move this decision logic
> to a helper script.

Now that I've spent a couple days starting to wrap my head more around
make, it doesn't look terribly magic to me. I'd hate to have to spawn
off a subshell for this.
