Return-Path: <linux-kbuild+bounces-4635-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1087B9C3CED
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 12:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B5A81F220DD
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 11:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B957F1953A9;
	Mon, 11 Nov 2024 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Z1Rad/aj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048D31885B0;
	Mon, 11 Nov 2024 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731323938; cv=none; b=DHWMbY5Eb5SPobt0t7y4/w+uRRGVa7vwfhLZuT61Z9ILxUb90LmNK5SSOREY73S+YX6o1ojqHCTPggknFxdTT3KWpEMTBwWWLSk5FLkOg+tF0HPf6aqKHo9ig6rtQgU7qYw6Ts1fcFIrNI9qXSu5uA2hdFeuV9Z5Tsqqs0SZEQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731323938; c=relaxed/simple;
	bh=AVTVQFaCxRrH60DxHmd5acjD1ixXYXYxIbQZmNktscg=;
	h=Message-Id:Date:From:To:Cc:Subject; b=inX3S5la+RvT1OAFoWGmmJMHg+IDcUa393+mV/0mVqOSPLLhmI3LQ9jndL5U0yTwCW5mbz8POJunOkdlrahjGPKvdC+wDpBj4pzRd541TS3J4nG1OKL7HzEaQv+a3rMpw4mIxuoz/ZtCCjCLHkoaFuEAd3lzDQ6DRK9MSRfKlzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Z1Rad/aj; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-Id:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=99NP88Axcs9KhoqW1tMbLJHKCZ3cOuZFnq7LB2MhYis=; b=Z1Rad/ajLhKK2ieSm7MOZM1Eu4
	LVa18CSsZBgpyIXhK5jfyQDFwmmSagPRLEWigZY+f+WDqZvwKPd/Xvu1UBgs7HwqzMrMXVhPex4s3
	7/rvNAnSjtI1idC1oHq6HAThJluqyjui/CdMds9LITd5ciKerAntLL/cbt//mNOW+j2lTCH8+iutq
	JALHI2TRxtW/j4uv3kVv+EdnTbfVxmu/jAl09gd/g2SF8VD+gaIAAvTmOJZIQTDmTmPLFK7bJgg8u
	wS9OigG/TUS/COPHYODuynOugA/rCrsO2FuDBYD1Xhu/PXg3G898Er1m89NVkafl9Ae/TvGXOICNJ
	YXb9CRjw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tASRT-0000000Cpw5-21cd;
	Mon, 11 Nov 2024 11:18:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id E8377300C1F; Mon, 11 Nov 2024 12:18:46 +0100 (CET)
Message-Id: <20241111105430.575636482@infradead.org>
User-Agent: quilt/0.65
Date: Mon, 11 Nov 2024 11:54:30 +0100
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
Subject: [RFC][PATCH 0/8] module: Strict per-modname namespaces
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Hi!

Implement a means for exports to be available only to an explicit list of named
modules. By explicitly limiting the usage of certain exports, the abuse
potential/risk is greatly reduced.

The first three 'patches' clean up the existing export namespace code along the
same lines of 33def8498fdd ("treewide: Convert macro and uses of __section(foo)
to __section("foo")") and for the same reason, it is not desired for the
namespace argument to be a macro expansion itself.

In fact, the second patch is really only a script, because sending the output
to the list is a giant waste of bandwidth. Whoever eventually commits this to a
git tree should squash these first three patches.

The remainder of the patches introduce the special "MODULE_<modname-list>"
namespace, which shall be forbidden from being explicitly imported. A module
that matches the simple modname-list will get an implicit import.

Lightly tested with something like:

git grep -l EXPORT_SYMBOL arch/x86/kvm/ | while read file;
do
  sed -i -e 's/EXPORT_SYMBOL_GPL(\(.[^)]*\))/EXPORT_SYMBOL_GPL_FOR(\1, "kvm,kvm-intel,kvm-amd")/g' $file;
done

Also available at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git module/namespace


