Return-Path: <linux-kbuild+bounces-6709-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B798DA94E75
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 11:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10B713AD0BA
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 09:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA48214213;
	Mon, 21 Apr 2025 09:12:41 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7C71A239B;
	Mon, 21 Apr 2025 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745226761; cv=none; b=C9MaCezYsVEdvnuJKXc8g7om2oJzFnQdbTkz2qLfVXoFWhQRL5sK9lMavhHhIedaBPek2JQCUly0/PN+7HP5UFGwWaQg+RF19PVf5xL/1o7T1mHMwF6Z1dIG/d0Z+ELDzSOA1X9d5QLrielc5poLJMHrVfUY4T1IF+PZphLvqyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745226761; c=relaxed/simple;
	bh=ZwnMT9iyHKRFWugR+0k3kpgyohlUA1bPJnpPrt50Yco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ino1n+c3kuO+8QFEgeaSBkZjxqrfdF0TbFuIFdqXeno3SUIttVdywit+SKA/nze7VZeRXlW03Pv24SWEEvNgi2Rp5TedLFMw5KZ95PKMmZ26Y+FbGDYyWIkWVtGiSvLe0PcikZtN5FanbmMwAHZtcqy+q3LuOArI1mi3TKPEHCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A997967373; Mon, 21 Apr 2025 11:12:33 +0200 (CEST)
Date: Mon, 21 Apr 2025 11:12:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <kees@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-sparse@vger.kernel.org,
	luc.vanoostenryck@gmail.com
Subject: Re: [PATCH] kbuild: Switch from -Wvla to -Wvla-larger-than=0
Message-ID: <20250421091233.GA21118@lst.de>
References: <20250418213235.work.532-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418213235.work.532-kees@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

Note that sparse currently also can't cope with VLAs including the
prototype syntax, which also needs addressing.


