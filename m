Return-Path: <linux-kbuild+bounces-6741-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5782AA9C0E3
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Apr 2025 10:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 962AB1BA6468
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Apr 2025 08:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8348922D78E;
	Fri, 25 Apr 2025 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="mtYIUZ1L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7191B6D11
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Apr 2025 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569558; cv=none; b=kQvbZD8+TcQl5BTdRuoWELExhn73zWommkYqPx3dVp/WM7rA3C+IQG4c0p5uhQ5d83QpaINK5coG+aba7zEKt5m4x4UG4roql6r5b+AlRIOa03fQnYXNlr7bldZ4Kyr/fRmaYbgpCIWgNttfUoG8b/5NjJzW11kTR7kmoYKZNVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569558; c=relaxed/simple;
	bh=HFeplX3tdVwOMaTsz8wnkOQJ9rOm4BnsAmlT/pbG5A0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZ6HbEEcP+S2i7+VqWwB9ony+fP7MwcEOjt+w+B39yd9yExDapw0e8OPm2H4NEl3NI+KSgnp97x7+P7qdugfZ1DT45Jw6UZLbeXdkeHrcxgEBdIQNoR517cKxSO5nYZdIyGrhzCDDPtHIseBTyEactvmyA5Br5bKhU61/xC84pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=mtYIUZ1L; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+bWzFlGCZvTmuGQ2UgAfZ+6xkvl5h4MIok0Y3X/+N90=; b=mtYIUZ1LMPlZBJ5ArhDxdGADlh
	AAfi7hXkjMhHCkdBzwpken0K85CSu7io4odXSulH4nIKrs7M0Pu+FUXY3E9cuqNXyqhR+hgU2wgXn
	jZ5CF/+LhIjcwX7akhKc6T3G38PJ/8PaMUV/uVZwn/bFY9tt6uESAtsBRdUh42LJ/GQiRSEP7sGBL
	qb9+qHJClf5W0sKXeGF0B/Nqd4ytkPVm/69w7LLi8cLhyrwrWngPJCbfZ5Elm32Y0/+j8OJVA8lf3
	LSJsMiUDJgquGP4FmL7LkhNvUrEnE7HSIH63dEajz87cwT8SMifAJxlNLvWp+Mh+o43xksEttpZ4s
	pyKHviBg==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1u8ENS-001MDU-P6;
	Fri, 25 Apr 2025 10:25:42 +0200
Date: Fri, 25 Apr 2025 10:25:38 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: how to create early build deps?
Message-ID: <20250425-bouncy-logical-ringtail-4d879a@lindesnes>
References: <202504161928.17A90D9B@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504161928.17A90D9B@keescook>

Hi Kees,

On Wed, Apr 16, 2025 at 07:55:02PM -0700, Kees Cook wrote:
> Hi!
> 
> I am stumped...
> 
> I swear there was a time when changing the gcc-plugins would trigger a
> full rebuild of all kernel sources. I tried to bisect where that stopped
> happening, but it went back far enough that things stopped building with
> my compiler at all. ;)
> 
> Anyway, I need this also for the Clang randstruct seed file -- if it
> changes, we need to rebuild everything. I thought this worked back in
> v5.19 when I moved the randstruct seed generation into scripts/basic[1],
> but regenerating it doesn't trigger a rebuild (with v5.19 nor current
> Linus nor linux-next):
> 
> $ make O=clang-all LLVM=1 allmodconfig kernel/seccomp.o
> make[1]: Entering directory '/srv/code/clang-all'
> ...
>   GENSEED scripts/basic/randstruct.seed
> ...
>   CC      kernel/seccomp.o
> make[1]: Leaving directory '/srv/code/clang-all'
> 
> $ rm clang-all/scripts/basic/randstruct.seed
> 
> $ make O=clang-all LLVM=1 kernel/seccomp.o
> make[1]: Entering directory '/srv/code/clang-all'
>   GEN     Makefile
>   GENSEED scripts/basic/randstruct.seed
>   DESCEND objtool
>   CALL    ../scripts/checksyscalls.sh
>   INSTALL libsubcmd_headers
> make[1]: Leaving directory '/srv/code/clang-all'
> 
> kernel/seccomp.o doesn't get rebuilt :(
> 
> By what mechanism can I convince kbuild to rebuild everything if
> randstruct.seed (or the gcc-plugins) are changed?

I think the easiest way to achieve a full rebuild due to changes in
scripts/basic/randstruct.seed would be to let it show up in
.$(target).cmd.  Limited testing with a very hacky thing like

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 8c311b997e24..1aceedfe0791 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -206,4 +206,5 @@ if_changed_dep = $(if $(if-changed-cond),$(cmd_and_fixdep),@:)
 cmd_and_fixdep =                                                             \
        $(cmd);                                                              \
        $(objtree)/scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).cmd;\
+       sed -i -re 's,../include/linux/compiler.h,& $(objtree)/scripts/basic/randstruct.seed,' $(dot-target).cmd ;\
        rm -f $(depfile)

looks promising to me.  But as far as I can see, fixdep does not have
similar hard-coded dependencies included, yet.  Thus I am unsure if
fixdep is really the this we want to touch for randstruct.seed.

Kind regards,
Nicolas

