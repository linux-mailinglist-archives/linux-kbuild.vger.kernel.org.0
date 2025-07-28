Return-Path: <linux-kbuild+bounces-8227-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A188B13E03
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 17:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C34667A8186
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 15:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB0C72621;
	Mon, 28 Jul 2025 15:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awdwmdJ+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27EE1C54A9;
	Mon, 28 Jul 2025 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753715724; cv=none; b=O+KmRLt7iOtCBlgapeFYzlJjBtabsYXZbq5wFeFsExV48umC/xe0uLNB3qOexj5eQQcrkNv9jqnptDe1g49habDd0zxE3IZVF9Q4/0ItKBb+9ZLJ4XMAcdbVUdf03p8hMUMkF11yZFbziF6RgurkiCPBDTbfQGc3tu+ZcpayaXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753715724; c=relaxed/simple;
	bh=R3KVZ8fjb4jXUeMt7oG9DwueLWEwVMlvhPNQ0QmygY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K99HME+TLA74QFgaLfveFsVcZg6gb142MkL5g7OBxCMceDjVAfT0OfQTm4ZCI1Jqbp15TXTI+k46EWyWz1usT6tB5I+LNndJOmyIcvXiT36NZAibf3kdv4e2h/ZukOp1aFesDi/J2/8ugqGMQROxhzdgGDku7kUEqknXOrw41K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awdwmdJ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18620C4CEF7;
	Mon, 28 Jul 2025 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753715723;
	bh=R3KVZ8fjb4jXUeMt7oG9DwueLWEwVMlvhPNQ0QmygY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=awdwmdJ+fLz71h/6uPjjGBbCrhQ4PHEsImB61iXit/IN2b336OUGQu4q7OcwynnM7
	 Z3qNjbJtqyrBBSLXuySUz/AMIOM8QZFojbrILpRPZtdZNTSG33OIWPQIQHtLl+VVZl
	 LSRRwsTUXWcpWgbhXkTXLT0ZptIS/dnMJRDEFseFPC5fRVADt6rtSBLs5TIJNTnXTl
	 KFIzoRWNUaeywS3oDP/kmEYfssAmB6a3th3OcKLcdbhAzStYIfZhBWyNVhXhAxIy+u
	 uTM5D/luiazBKyEyT0K50hYadUO4K3/8ZsTKKU6YXlObDwHUr9zvGoRMPfQQtTJ44f
	 zUHxZNQqAonOA==
Date: Mon, 28 Jul 2025 17:15:15 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v5 03/10] kbuild: keep .modinfo section in
 vmlinux.unstripped
Message-ID: <aIeUA6ZeFqx-tboP@example.org>
References: <cover.1753354215.git.legion@kernel.org>
 <d44055fc22d4a53b7f87758d31cb4d640c8f8cca.1753354215.git.legion@kernel.org>
 <20250728135753.432695A72-agordeev@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728135753.432695A72-agordeev@linux.ibm.com>

On Mon, Jul 28, 2025 at 03:57:53PM +0200, Alexander Gordeev wrote:
> On Thu, Jul 24, 2025 at 03:49:40PM +0200, Alexey Gladkov wrote:
> 
> Hi Alexey, Masahiro,
> 
> > From: Masahiro Yamada <masahiroy@kernel.org>
> > 
> > Keep the .modinfo section during linking, but strip it from the final
> > vmlinux.
> > 
> > Adjust scripts/mksysmap to exclude modinfo symbols from kallsyms.
> > 
> > This change will allow the next commit to extract the .modinfo section
> > from the vmlinux.unstripped intermediate.
> > 
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >  include/asm-generic/vmlinux.lds.h | 2 +-
> >  scripts/Makefile.vmlinux          | 2 +-
> >  scripts/mksysmap                  | 3 +++
> >  3 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> > index fa5f19b8d53a..1791665006f9 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -831,6 +831,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
> >  
> >  /* Required sections not related to debugging. */
> >  #define ELF_DETAILS							\
> > +		.modinfo : { *(.modinfo) }				\
> 
> FWIW, to me .modinfo logically does not quite belong to ELF_DETAILS,
> since it is not about ELF.

The macro name ELF_DETAILS is rather unfortunate. The description says
that these sections are not related to debugging.

> I would guess, that you want to make a minimal code impact to the
> linker scripts, but with that you turn .modinfo the only section
> among ones that do not make it to the final image:
> 
> 	STABS_DEBUG
> 	DWARF_DEBUG
> 	ELF_DETAILS
> 
> That immediately breaks s390, but also is a call for trouble in
> the future, as far as I am concerned.
> 
> Would it makes sense to introduce e.g MODINFO instead?

This will require patching all architectures to add MODINFO. This will
have a significant code impact. To avoid this, .modinfo was added to
ELF_DETAILS.

> >  		.comment 0 : { *(.comment) }				\
> >  		.symtab 0 : { *(.symtab) }				\
> >  		.strtab 0 : { *(.strtab) }				\
> > @@ -1044,7 +1045,6 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
> >  	*(.discard.*)							\
> >  	*(.export_symbol)						\
> >  	*(.no_trim_symbol)						\
> > -	*(.modinfo)							\
> >  	/* ld.bfd warns about .gnu.version* even when not emitted */	\
> >  	*(.gnu.version*)						\
> 
> Thanks!
> 

-- 
Rgrds, legion


