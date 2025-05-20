Return-Path: <linux-kbuild+bounces-7158-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB72ABCEA7
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 07:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 703173BB7C8
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 05:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31631EE021;
	Tue, 20 May 2025 05:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="VdGuVQ/G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA0219259F;
	Tue, 20 May 2025 05:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747719128; cv=none; b=LI+3RoJBTnLi7hroGA0qZbcsfPsEcXdm5EZyOMt2mGc2u9WEmZxFFiZ78UMBUZkxiHSJB7GU7DN914E3HCx05GjYkVg5B/EFoxJ8nTDCE/FGbsvj/5YkEn94a8jX2fvwLED0dYi8S2C5bLmfYz1Tghef+Fop7ZAmVlelIfr7KC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747719128; c=relaxed/simple;
	bh=v4q0Gk8P5oFHzr7Kz+il+G+hoCCYfCJwrgES5RPGDhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=taEArpAbF8+RDqUcQWDZF4dZzSFtHmo3XRv7Q28HkS3eLtwC5JNrmworwKJJl4VCmq49rTvVRHkAd0k6eKZCybNVjMBj+d50xSLkIsGKSU7fAZyUwenkyy4aVi3EVpw/+eAwQ+KFlf/Ue7VdhBlHgwlTptN+IBLMuGHt2WJk2p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=VdGuVQ/G; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CEF9C2839B9;
	Tue, 20 May 2025 07:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1747718550; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=FDyLwH77vg3CASVyQv8HrTOuhW5BbUUEY0GojGOfT9s=;
	b=VdGuVQ/GW/N3jorqXQYofNoumohsvZ8E2lw/od1w4WVTp3oo9LoZ6O582RGLbAQAKRZbGD
	/ePXlI7jNr2ZoBUQZXDQSIh3Qmhc75wXortexycOkHM2a64R18dlsERdrEN+Gf6ucdse4L
	UsZ2GjLtQn1r8e0lsvaNvnIGjq8QZtpoqu9hpa2oXSqoIbisJSB08OSgrSdXiwa3n6F+Lz
	V+IP0jmonLqd/GneN4zH8tl6n7qbAwMBsjufZbpfYrxAS3pYnzcsvQ0zbTZHvijkCPWn64
	5OcpZuKRuWnSgK9KpSCQh39hPvHNcCxvcEdXLkrJV7yMNDdZnW8E2MAHJlvRVA==
Message-ID: <a2db22a3-6d66-481d-9432-b38b83e17183@cachyos.org>
Date: Tue, 20 May 2025 13:22:15 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kbuild: distributed build support for Clang ThinLTO
To: xur@google.com, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Alice Ryhl <aliceryhl@google.com>, Sami Tolvanen <samitolvanen@google.com>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Stafford Horne <shorne@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250507205504.2017028-1-xur@google.com>
Content-Language: en-US
From: Eric Naim <dnaim@cachyos.org>
In-Reply-To: <20250507205504.2017028-1-xur@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Rong Xu,

On 5/8/25 04:55, xur@google.com wrote:
> From: Rong Xu <xur@google.com>
> 
> Add distributed ThinLTO build support for the Linux kernel.
> This new mode offers several advantages: (1) Increased
> flexibility in handling user-specified build options.
> (2) Improved user-friendliness for developers. (3) Greater
> convenience for integrating with objtool and livepatch.
> 
> Note that "distributed" in this context refers to a term
> that differentiates in-process ThinLTO builds by invoking
> backend compilation through the linker, not necessarily
> building in distributed environments.
> 
> Distributed ThinLTO is enabled via the
> `CONFIG_LTO_CLANG_THIN_DIST` Kconfig option. For example:
>  > make LLVM=1 defconfig
>  > scripts/config -e LTO_CLANG_THIN_DIST
>  > make LLVM=1 oldconfig
>  > make LLVM=1 vmlinux -j <..>
> 
> The implementation changes the top-level Makefile with a
> macro for generating `vmlinux.o` for distributed ThinLTO
> builds. It uses the existing Kbuild infrastructure to
> perform two recursive passes through the subdirectories.
> The first pass generates LLVM IR object files, similar to
> in-process ThinLTO. Following the thin-link stage, a second
> pass compiles these IR files into the final native object
> files. The build rules and actions for this two-pass process
> are primarily implemented in `scripts/Makefile.build`.
> 
> Currently, this patch focuses on building the main kernel
> image (`vmlinux`) only. Support for building kernel modules
> using this method is planned for a subsequent patch.
> 
> Tested on the following arch: x86, arm64, loongarch, and
> riscv.
> 
> Some implementation details can be found here:
> https://discourse.llvm.org/t/rfc-distributed-thinlto-build-for-kernel/85934
> 
> Signed-off-by: Rong Xu <xur@google.com>
> ---
> Changelog since v1:
> - Updated the description in arch/Kconfig based on feedback
>   from Nathan Chancellor
> - Revised file suffixes: .final_o -> .o.thinlto.native, and
>   .final_a -> .a.thinlto.native
> - Updated list of ignored files in .gitignore
> ---
>  .gitignore                        |  2 ++
>  MAINTAINERS                       |  5 +++
>  Makefile                          | 40 ++++++++++++++++++++---
>  arch/Kconfig                      | 19 +++++++++++
>  scripts/Makefile.build            | 52 +++++++++++++++++++++++++++---
>  scripts/Makefile.lib              |  7 +++-
>  scripts/Makefile.vmlinux_o        | 16 +++++++---
>  scripts/Makefile.vmlinux_thinlink | 53 +++++++++++++++++++++++++++++++
>  scripts/head-object-list.txt      |  1 +
>  9 files changed, 180 insertions(+), 15 deletions(-)
>  create mode 100644 scripts/Makefile.vmlinux_thinlink
> 

I noticed that both Makefile.autofdo and Makefile.propeller add extra linker flags when building with ThinLTO. Did you miss updating that or is the omission there intentional? 

-- 
Regards,
  Eric

