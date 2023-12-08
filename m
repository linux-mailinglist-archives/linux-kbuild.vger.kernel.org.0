Return-Path: <linux-kbuild+bounces-298-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF81780A44E
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Dec 2023 14:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C140281BA9
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Dec 2023 13:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4EC01CA82;
	Fri,  8 Dec 2023 13:17:00 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [IPv6:2001:bf0:244:244::119])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E6A619AE
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Dec 2023 05:16:49 -0800 (PST)
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri,  8 Dec 2023 14:16:40 +0100 (CET)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 9119C806BE;
	Fri,  8 Dec 2023 14:16:40 +0100 (CET)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 81758180D88; Fri,  8 Dec 2023 14:16:40 +0100 (CET)
Date: Fri, 8 Dec 2023 14:16:40 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Leonardo Bras <leobras.c@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [RESEND RFC PATCH v4 1/1] scripts: Introduce a default
 git.orderFile
Message-ID: <ZXMXOPxyx7YGB43l@buildd.core.avm.de>
Mail-Followup-To: Leonardo Bras <leobras.c@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
References: <20231205182853.40627-1-leobras.c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205182853.40627-1-leobras.c@gmail.com>
X-purgate-ID: 149429::1702041400-BD6E3A59-C7872309/0/0
X-purgate-type: clean
X-purgate-size: 2482
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Tue, Dec 05, 2023 at 03:28:51PM -0300, Leonardo Bras wrote:
> From: Leonardo Bras <leobras@redhat.com>
> 
> When reviewing patches, it looks much nicer to have some changes shown
> before others, which allow better understanding of the patch before the
> the .c files reviewing.
> 
> Introduce a default git.orderFile, in order to help developers getting the
> best ordering easier.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> 
> Please provide feedback on what else to add / remove / reorder here!
> 
> Changes since RFCv3:
> - Added "*types.h" matching so type headers appear before regular headers
> - Removed line ends ($) in patterns: they previously provided a 
>   false-positive
> - Fixed build patterns to allow matching Kconfig, Kbuild & Makefile
>   in any subdirectory
> 
> Changes since RFCv2:
> - Fixed licence comment to from /**/ to #
> - Fixed filename in how-to comment
> - Fix build order: Kconfig -> Kbuild -> Makefile
> - Add *.mk extension 
> - Add line-ends ($) to make sure and get the correct extensions
> - Thanks Masahiro Yamada for above suggestions!
> - 1 Ack, thanks Randy!
> 
> Changes since RFCv1:
> - Added Kconfig* (thanks Randy Dunlap!)
> - Changed Kbuild to Kbuild* (improve matching)
> 
> 
>  scripts/git.orderFile | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 scripts/git.orderFile
> 
> diff --git a/scripts/git.orderFile b/scripts/git.orderFile
> new file mode 100644
> index 000000000000..7cef02cbba3c
> --- /dev/null
> +++ b/scripts/git.orderFile
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# order file for git, to produce patches which are easier to review
> +# by diffing the important stuff like header changes first.
> +#
> +# one-off usage:
> +#   git diff -O scripts/git.orderFile ...
> +#
> +# add to git config:
> +#   git config diff.orderFile scripts/git.orderFile
> +#
> +
> +MAINTAINERS
> +
> +# Documentation
> +Documentation/*
> +*.rst
> +
> +# build system
> +*Kconfig*
> +*Kbuild*
> +*Makefile*
> +*.mak
> +*.mk

I'd like to see 'scripts/*' here, too, to have the build system stuff
together.  Possibly it makes sense to add .gitignore files here too.

Kind regards,
Nicolas


> +
> +# semantic patches
> +*.cocci
> +
> +# headers
> +*types.h
> +*.h
> +
> +# code
> +*.c
> -- 
> 2.42.0
> 

