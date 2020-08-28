Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E8A2558EE
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Aug 2020 12:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728991AbgH1K4J (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Aug 2020 06:56:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:35890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729167AbgH1Kzb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Aug 2020 06:55:31 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C9622086A;
        Fri, 28 Aug 2020 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598612019;
        bh=ce3X+CPXzJjnM0v2Pf7vZBH3LAK5LaMCifbYFTYxHyA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F5kulvvskGAw7Hzf3n36URW/HuM8K6Hfv9ZBNXC9A5Gw2+uxEBiS4+D0a9tuPdAp9
         FMu0LhcsXtQKCkXMb88X9rxPp2M8LKF5JcupazFZdaiUtzt99deBSMtXSnw31L0hJ1
         JmiD/PHE99dA86SAQRl4hRWwX3xpRjhVVDb/IgQ4=
Date:   Fri, 28 Aug 2020 11:53:34 +0100
From:   Will Deacon <will@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Theodore Ts'o <tytso@mit.edu>, Borislav Petkov <bp@suse.de>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: add minimum clang/llvm version
Message-ID: <20200828105334.GA30563@willie-the-truck>
References: <20200826191555.3350406-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826191555.3350406-1-ndesaulniers@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 26, 2020 at 12:15:55PM -0700, Nick Desaulniers wrote:
> Based on a vote at the LLVM BoF at Plumbers 2020, we decided to start
> small, supporting just one formal upstream release of LLVM for now.
> 
> We can probably widen the support window of supported versions over
> time.  Also, note that LLVM's release process is different than GCC's.
> GCC tends to have 1 major release per year while releasing minor updates
> to the past 3 major versions.  LLVM tends to support one major release
> and one minor release every six months.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes V1 -> V2:
> * fix typo, as per Will.
> * add link to getting LLVM, as per Nathan.
> * collect tags.

Acked-by: Will Deacon <will@kernel.org>

Will
