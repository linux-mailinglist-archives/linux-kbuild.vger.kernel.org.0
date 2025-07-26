Return-Path: <linux-kbuild+bounces-8192-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A05B12973
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 09:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 702E53AE15B
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 07:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B788215077;
	Sat, 26 Jul 2025 07:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gswPVrHk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6B93770B;
	Sat, 26 Jul 2025 07:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753515740; cv=none; b=EZ6f//1lrUZE+RcDD+z6wdJ2ue0iG89kKL1es9dkA9HHdOpDZ02yGWPYCxuG4gBWuBBygeJSVLXCKldWMhC/hg9ks3ODw1fat+5jpmm5njkBf1L40mHsLVlmSk1V7UfJOhbsYCE7WGn98wXxW+HCE+E9kg2sZk1+5mE6FaCWaZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753515740; c=relaxed/simple;
	bh=JH80ui6HzMZrysAZcLLCGsZmU6VvUIi+CTfUhFaghYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/2Fe+c3/j0fvNxmJl0jm+O+GvK+uW4IYP2ONcWexw3EgcksRDrgNPlft+icrZCGOUleU7us2kNX90w8bmCmBdbPV495DfiAgiMXZSSnkOgSDv/zhhYfWY7M9N57plD6YSktLi2eIVrMMwq5TjGS6Z6H+hmM0zWow8iOK5hwkrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gswPVrHk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1BAC4CEED;
	Sat, 26 Jul 2025 07:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753515738;
	bh=JH80ui6HzMZrysAZcLLCGsZmU6VvUIi+CTfUhFaghYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gswPVrHk05CTmMSr0rmQsIvvtZGLK84sbkhG7vujS1AtdBJA3iUrxjWoNK98NMpda
	 ONzMzbP/rH/UKNn5AGjuowNFtCTTKJdWOGXj7+cXUBv4SjmXHMqXaZJ89BtyrLgtao
	 sSgrF+ZyPF68pEsFAuSeuuJQHuOzMAPxqSA19FKpb4XI3RynqKvZ9IPmNqv5FW9t1t
	 Itp5hGadOCbL7KVHwUT5/b25VhAxaXhNZif1/oxZZKHKJPwkfA8HoTwEF5HY7nWkCV
	 GGzrb4UeOALjgC2TLEYJIW4g8y91Wkoc30JITbnWHVGq3pXn4NFuyACkQGvB1r09oS
	 4LB9QaOFiYRwQ==
Date: Sat, 26 Jul 2025 10:42:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, samitolvanen@google.com,
	apatel@ventanamicro.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com,
	samuel.holland@sifive.com, bjorn@rivosinc.com, fweimer@redhat.com,
	jeffreyalaw@gmail.com, heinrich.schuchardt@canonical.com,
	andrew@sifive.com, ved@rivosinc.com
Subject: Re: [PATCH 06/11] mm: Introduce ARCH_HAS_KERNEL_SHADOW_STACK
Message-ID: <aISGypOAaDGaUZgd@kernel.org>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-6-04b8fa44c98c@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-riscv_kcfi-v1-6-04b8fa44c98c@rivosinc.com>

On Thu, Jul 24, 2025 at 04:36:59PM -0700, Deepak Gupta wrote:
> commit bcc9d04e74 ("mm: Introduce ARCH_HAS_USER_SHADOW_STACK") introduced
> `ARCH_HAS_USER_SHADOW_STACK`. Introducing `ARCH_HAS_KERNEL_SHADOW_STACK`
> so that arches can enable hardware assistance for kernel shadow stack.
> 
> If `CONFIG_DYNAMIC_SCS` or `CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK` are
> selected, skip compiler flag `-fsanitizer=shadow-call-stack`.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  Makefile   | 2 +-
>  mm/Kconfig | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 35e6e5240c61..7e3ecca9353d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -987,7 +987,7 @@ LDFLAGS_vmlinux += --gc-sections
>  endif
>  
>  ifdef CONFIG_SHADOW_CALL_STACK
> -ifndef CONFIG_DYNAMIC_SCS
> +ifeq ($(or $(CONFIG_DYNAMIC_SCS),$(CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK)),false)
>  CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
>  KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
>  KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 781be3240e21..f295ea611cdb 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1367,6 +1367,12 @@ config ARCH_HAS_USER_SHADOW_STACK
>  	  The architecture has hardware support for userspace shadow call
>            stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>  
> +config ARCH_HAS_KERNEL_SHADOW_STACK
> +	bool
> +	help
> +	  The architecture has hardware support for kernel shadow call
> +          stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).

nit: tab and two space for indentation of the help text

> +

I think both ARCH_HAS_USER_SHADOW_STACK and ARCH_HAS_KERNEL_SHADOW_STACK
belong to arch/Kconfig rather than mm/Kconfig

>  config ARCH_SUPPORTS_PT_RECLAIM
>  	def_bool n
>  
> 
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.

