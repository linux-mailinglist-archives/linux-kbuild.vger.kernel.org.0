Return-Path: <linux-kbuild+bounces-8826-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E43BB583A7
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Sep 2025 19:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 356757A7718
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Sep 2025 17:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3D62BDC02;
	Mon, 15 Sep 2025 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkuOsgYO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437B229BDBA;
	Mon, 15 Sep 2025 17:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757957454; cv=none; b=Efh17La2hkxVYNi8eUaLbL31bKHSZPKmQUjgUB3hOsXq4ZpQRBNbF5WNHCkspSryzbBi9c/r0vErgJo70tThCToEctX+kpJR5i602yeVpAbPXom/PsfYlNrFUNk//fZg9mizzVVJW92Qco4RXRnbRDj0vpDVjpJa3I+mkKRnPeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757957454; c=relaxed/simple;
	bh=d0uiTV0FLlDekg05gVtL0PWv+SDj/bAX7hFr0eZWj+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrDM90ha5QZcT0Lo+WNwONoGVNWsw2sgJAgEs9Hk1nz46JbbORZnhkNS8tCp1CiZyxDQ5i8wQwbR3W221DMOiWkaw1TRXmDrxQaCukxq5+B+d3shNJOEygxfKrpcRHCzCIdHi4iJirB44c2tuUcCN5wTj/HoGn3Jp+6+RghCAjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkuOsgYO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBB1C4CEF7;
	Mon, 15 Sep 2025 17:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757957453;
	bh=d0uiTV0FLlDekg05gVtL0PWv+SDj/bAX7hFr0eZWj+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkuOsgYOvu58oToRsDi9Nx/v8OaO5+vSq8hsFcnk7cwMqXrBc/BF+uvGDApqWIx6Y
	 0YAfR58LXnFMIHzeY4qwSzmjEbzKcZkV9tUZPGS+xaZ+H9QlEto2n4oZbd5PSXtJiA
	 4PfS+SeEiUUfBu1CKpwIKbu8NfEv55eBZADfm7fMFqhhoddz2fv/m90qT9DxEINI8k
	 ZGCyxxTKNnb4aUTGVvDtPQlNZrjk+w6hbz632dfvp4Ss51QXMBwQKIZPTnp4UK43ue
	 xdZMywnIbZsPSHaLyLNUc3/wAih0wuZHiYhoOD2hVTw5+7Vt4ZCWfYncCUtGIQy2tp
	 Q2VF4BAlQQODQ==
Date: Mon, 15 Sep 2025 07:56:16 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Alexey Gladkov <legion@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v7 3/8] kbuild: keep .modinfo section in
 vmlinux.unstripped
Message-ID: <aMeqgPVfJcjBLhl8@levanger>
References: <cover.1755535876.git.legion@kernel.org>
 <4d53c72293d88b663257a0d723ebf3473a08b374.1755535876.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d53c72293d88b663257a0d723ebf3473a08b374.1755535876.git.legion@kernel.org>

On Mon, Aug 18, 2025 at 06:54:57PM +0200, Alexey Gladkov wrote:
> From: Masahiro Yamada <masahiroy@kernel.org>
> 
> Keep the .modinfo section during linking, but strip it from the final
> vmlinux.
> 
> Adjust scripts/mksysmap to exclude modinfo symbols from kallsyms.
> 
> This change will allow the next commit to extract the .modinfo section
> from the vmlinux.unstripped intermediate.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>  include/asm-generic/vmlinux.lds.h | 2 +-
>  scripts/Makefile.vmlinux          | 2 +-
>  scripts/mksysmap                  | 3 +++
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index ae2d2359b79e9..cfa63860dfd4c 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -831,6 +831,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
>  
>  /* Required sections not related to debugging. */
>  #define ELF_DETAILS							\
> +		.modinfo : { *(.modinfo) }				\
>  		.comment 0 : { *(.comment) }				\
>  		.symtab 0 : { *(.symtab) }				\
>  		.strtab 0 : { *(.strtab) }				\
> @@ -1044,7 +1045,6 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
>  	*(.discard.*)							\
>  	*(.export_symbol)						\
>  	*(.no_trim_symbol)						\
> -	*(.modinfo)							\
>  	/* ld.bfd warns about .gnu.version* even when not emitted */	\
>  	*(.gnu.version*)						\
>  
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 4f2d4c3fb7372..e2ceeb9e168d4 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -86,7 +86,7 @@ endif
>  # vmlinux
>  # ---------------------------------------------------------------------------
>  
> -remove-section-y                                   :=
> +remove-section-y                                   := .modinfo
>  remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
>  
>  quiet_cmd_strip_relocs = OBJCOPY $@
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index 3accbdb269ac7..a607a0059d119 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -79,6 +79,9 @@
>  / _SDA_BASE_$/d
>  / _SDA2_BASE_$/d
>  
> +# MODULE_INFO()
> +/ __UNIQUE_ID_modinfo[0-9]*$/d
> +
>  # ---------------------------------------------------------------------------
>  # Ignored patterns
>  #  (symbols that contain the pattern are ignored)
> -- 
> 2.50.1
> 

Hi Alexey,

with this patch applied, I still get a warning from objcpy as Masahiro
and Stephen wrote [1,2]

  SORTTAB vmlinux.unstripped
+ sorttable vmlinux.unstripped
+ nm -S vmlinux.unstripped
+ ./scripts/sorttable -s .tmp_vmlinux.nm-sort vmlinux.unstripped
+ is_enabled CONFIG_KALLSYMS
+ grep -q ^CONFIG_KALLSYMS=y include/config/auto.conf
+ cmp -s System.map .tmp_vmlinux2.syms
+ echo vmlinux.unstripped: ../scripts/link-vmlinux.sh
# OBJCOPY vmlinux
  objcopy --remove-section=.modinfo vmlinux.unstripped vmlinux
objcopy: vmlinux.unstripped: warning: empty loadable segment detected at vaddr=0xffff8000807a0000, is this intentional?

(arm64, allnoconfig)

Kind regards,
Nicolas


[1]: https://lore.kernel.org/linux-kbuild/CAK7LNAR-gD2H6Kk-rZjo0R3weTHCGTm0a=u2tRH1WWW6Sx6=RQ@mail.gmail.com/
[2]: https://lore.kernel.org/lkml/20250730164047.7c4a731a@canb.auug.org.au/


