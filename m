Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 273EE36212F
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 15:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235724AbhDPNjT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 09:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244120AbhDPNjS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 09:39:18 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C2EC061574;
        Fri, 16 Apr 2021 06:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Oj/fWAhs31bJWwFY86CV59sd9Zza6E359cV1eJHfuf8=; b=YvswR+OJUHyRCNkqXe+cj7OE/x
        moZv4q23OFJExA8D9F7fO4a1wuLpujs1DV1tr/G+hp/+oaG4ibrZuel2zUse16Uetw94gutySbxNF
        CygLbNlxkkYS2ro7ptyMy+hw94RkunBsMdN+NPKbsq7K1mBrK97ERS/OYPTOzG1wrtQ/CAJxYPXfG
        V5vQtNXOSVZ2YaXWpDyAOQCvAHHJvZ3ki7TJBRBB5ndnhdHx6jmCM7inL2z2aBTcoYR7IrFVrA7dn
        F1EH2QZNfCa2hqiMszrLp0ycBQ4uFGovqD8ZSShiNJHjU7hKCl0n1ZWpOWvK3xExHYO+urcJghj1R
        gBjisRUA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lXOg5-002GOp-Ce; Fri, 16 Apr 2021 13:38:36 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 85CD5300222;
        Fri, 16 Apr 2021 15:38:32 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 281262C067030; Fri, 16 Apr 2021 15:38:32 +0200 (CEST)
Date:   Fri, 16 Apr 2021 15:38:32 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
Message-ID: <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414184604.23473-5-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414184604.23473-5-ojeda@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 08:45:55PM +0200, ojeda@kernel.org wrote:
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 1b6094a13034..3665c49c4dcf 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -26,6 +26,7 @@ EXTRA_CPPFLAGS :=
>  EXTRA_LDFLAGS  :=
>  asflags-y  :=
>  ccflags-y  :=
> +rustcflags-y :=
>  cppflags-y :=
>  ldflags-y  :=
>  
> @@ -287,6 +288,24 @@ quiet_cmd_cc_lst_c = MKLST   $@
>  $(obj)/%.lst: $(src)/%.c FORCE
>  	$(call if_changed_dep,cc_lst_c)
>  
> +# Compile Rust sources (.rs)
> +# ---------------------------------------------------------------------------
> +
> +rustc_cross_flags := --target=$(srctree)/arch/$(SRCARCH)/rust/target.json
> +
> +quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
> +      cmd_rustc_o_rs = \
> +	RUST_MODFILE=$(modfile) \
> +	$(RUSTC_OR_CLIPPY) $(rustc_flags) $(rustc_cross_flags) \
> +		--extern alloc --extern kernel \
> +		--crate-type rlib --out-dir $(obj) -L $(objtree)/rust/ \
> +		--crate-name $(patsubst %.o,%,$(notdir $@)) $<; \
> +	mv $(obj)/$(subst .o,,$(notdir $@)).d $(depfile); \
> +	sed -i '/^\#/d' $(depfile)
> +
> +$(obj)/%.o: $(src)/%.rs FORCE
> +	$(call if_changed_dep,rustc_o_rs)
> +
>  # Compile assembler sources (.S)
>  # ---------------------------------------------------------------------------
>  

So if I read all this right, rust compiles to .o and, like any other .o
file is then fed into objtool (for x86_64). Did you have any problems
with objtool? Does it generate correct ORC unwind information?

AFAICT rust has try/throw/catch exception handling (like
C++/Java/others) which is typically implemented with stack unwinding of
its own.

Does all that interact sanely?
