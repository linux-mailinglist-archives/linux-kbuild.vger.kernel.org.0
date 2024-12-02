Return-Path: <linux-kbuild+bounces-4931-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E52389E07B4
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 16:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48E70168676
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 15:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E6820ADC4;
	Mon,  2 Dec 2024 15:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Fnbh6psY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C2B209F43;
	Mon,  2 Dec 2024 15:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152299; cv=none; b=JTf7B0Dh1nvReVM5id7FYTNSSrY2mdMEEEnv/GfcBKJSGIjwoosyjfD2XE/WkuphxD5qvibvIPc8P9k76MHSauTduIt8Ah2XObnj0cEPRUTegIAtYvIFxVW4wVo8wJ2bFmZGtHw3TZel6l6W2AqSsQK9hwUg2VunLR9e4Rz66E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152299; c=relaxed/simple;
	bh=jCq9Hmkd8YjDFv+26S0VAnOIYjbcyTSuRXRHXq6WfdA=;
	h=Message-ID:Date:From:To:Cc:Subject; b=D/Q5BWrp20KH5ixhTS5/cKtMBQACn0z+/5I15hgX4HWtZwT2jVaiKiAiBpQ2SzuvQeXs2bYIBiLIlVn3c8ob8C0Y/iuuPhWNimjwY+ao6uHmAnPJn+FEk6w6plCR7+KIMkkpSzNdRvVNFDWQELAdJZrw72n+wissD3TPIPMqbj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Fnbh6psY; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=mIDblaCJImqyIwpr1OpwkjMm/2RN8PKElVUd1eIcx3I=; b=Fnbh6psYu7vE2KG80F+3Jc2ImK
	1tKsV+L+8Zq4hkp0xEqeO1zJz3rGE34r4lvhDeV7pPYxTuOfjMoyZjiAQtBMXDDJiGscnZb4Xydd3
	GmnUTH5pJg9Dl9q7tbpv10E56p2DlM4bG7iKmR2ymEvVRhUd1P+/AsAh9h4osXQ/1UzcYbldxIghb
	ENlWSQiZoIWnpN42MFQb29zp8hTIawa6sJwTMMGq3ga/wZrq+zsl3AOS05OAgu3NjSsE5/6l2HVbG
	OD6fKww16lQDR0IJgU4/rUTFeUL276xFuGakZr/C1BdUG5OVKkHEgUJfwM4XJSFSK3/pqXrTG3QuP
	L4JxLFKQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tI859-00000008CPo-18Xv;
	Mon, 02 Dec 2024 15:11:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id BA446300402; Mon,  2 Dec 2024 16:11:27 +0100 (CET)
Message-ID: <20241202145946.108093528@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Dec 2024 15:59:46 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mcgrof@kernel.org
Cc: x86@kernel.org,
 hpa@zytor.com,
 petr.pavlu@suse.com,
 samitolvanen@google.com,
 da.gomez@samsung.com,
 masahiroy@kernel.org,
 nathan@kernel.org,
 nicolas@fjasle.eu,
 linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 hch@infradead.org,
 gregkh@linuxfoundation.org
Subject: [PATCH -v2 0/7] module: Strict per-modname namespaces
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Hi!

Implement a means for exports to be available only to an explicit list of named
modules. By explicitly limiting the usage of certain exports, the abuse
potential/risk is greatly reduced.

The first 'patch' is an awk scripts that cleans up the existing module
namespace code along the same lines of commit 33def8498fdd ("treewide: Convert
macro and uses of __section(foo) to __section("foo")") and for the same reason,
it is not desired for the namespace argument to be a macro expansion itself.

The remainder of the patches introduce the special "MODULE_<modname-list>"
namespace, which shall be forbidden from being explicitly imported. A module
that matches the simple modname-list will get an implicit import.

Lightly tested with something like:

  git grep -l EXPORT_SYMBOL arch/x86/kvm/ | while read file;
  do
    sed -i -e 's/EXPORT_SYMBOL_GPL(\(.[^)]*\))/EXPORT_SYMBOL_GPL_FOR(\1, "kvm,kvm-intel,kvm-amd")/g' $file;
  done

With that, some configs generate:

  ERROR: modpost: module kvmgt uses symbol kvm_write_track_add_gfn from namespace MODULE_kvm,kvm-intel,kvm-amd, but does not import it.
  ERROR: modpost: module kvmgt uses symbol kvm_write_track_remove_gfn from namespace MODULE_kvm,kvm-intel,kvm-amd, but does not import it.
  ERROR: modpost: module kvmgt uses symbol kvm_page_track_register_notifier from namespace MODULE_kvm,kvm-intel,kvm-amd, but does not import it.
  ERROR: modpost: module kvmgt uses symbol kvm_page_track_unregister_notifier from namespace MODULE_kvm,kvm-intel,kvm-amd, but does not import it.

Showing it works :-). Also verified that once booted, the module kvm_intel does
actually load.


Also available at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git module/namespace

Changes since RFC/v1:

 - use awk instead of sed so all changes are a single script (hch)
 - deal with kbuild mangling the module names like s/-/_/g (sean)
 - fixup clang-ias 'funnies'


