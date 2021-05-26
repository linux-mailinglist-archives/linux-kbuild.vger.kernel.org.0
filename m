Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2441391D8F
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 19:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbhEZRKm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 May 2021 13:10:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:47328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233865AbhEZRKl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 May 2021 13:10:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1040261184;
        Wed, 26 May 2021 17:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622048950;
        bh=biO76sc5FCTa0wyLLXe84EZAo5umTos5Aaw3fIOyp3E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ga8DyAAu7d5Ve5RJbz9ED6rSGBvqwlgut9+DkeOjoWvKxJdW387cDvxdXM/wGn2LS
         0rHeiaOwBCIKXDurcfvZlDwpeW5hA+7Ov3zFGM5AAk7ZQaB6jL6EvqhA/M4O0/0Uk3
         wXS1wbP0CVLtLWMvJ314uO4G2V8NlYCxHByKPXg8X117RapyOkED1ynjOCZ5Q8fG/q
         /osMjFavVvDcLHW32ATZQKkzh9BduEqGZ705Tw60leIFY1h8IgpAt/l778951AITAL
         vvA6C+VqSRQH1rz5y8SjRAR4Lo/PHRkJ8AseKaBRZAeRmxQLT7lDCFr4NRLrauvA3U
         RI+IFtNn3MTCA==
Date:   Wed, 26 May 2021 18:09:04 +0100
From:   Will Deacon <will@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Lee Jones <lee.jones@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Elliot Berman <eberman@quicinc.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Collingbourne <pcc@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2] Makefile: fix GDB warning with CONFIG_RELR
Message-ID: <20210526170904.GB19831@willie-the-truck>
References: <CAK7LNAS_LpZnweujqVwZ1kL0eDYR726k35U_yx1djqNE0bk6Rw@mail.gmail.com>
 <20210522012626.2811297-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210522012626.2811297-1-ndesaulniers@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 21, 2021 at 06:26:24PM -0700, Nick Desaulniers wrote:
> GDB produces the following warning when debugging kernels built with
> CONFIG_RELR:
> 
> BFD: /android0/linux-next/vmlinux: unknown type [0x13] section `.relr.dyn'
> 
> when loading a kernel built with CONFIG_RELR into GDB. It can also
> prevent debugging symbols using such relocations.
> 
> Peter sugguests:
>   [That flag] means that lld will use dynamic tags and section type
>   numbers in the OS-specific range rather than the generic range. The
>   kernel itself doesn't care about these numbers; it determines the
>   location of the RELR section using symbols defined by a linker script.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1057
> Suggested-by: Peter Collingbourne <pcc@google.com>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes V1 -> V2:
> * rebase
> * pick up Nathan's reviewed by tag.
> 
>  Makefile                      | 2 +-
>  scripts/tools-support-relr.sh | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Does lld support RELR relocations for any architectures other than arm64? If
so, is the "--use-android-relr-tags" option supported on all of those as
well?

Will
