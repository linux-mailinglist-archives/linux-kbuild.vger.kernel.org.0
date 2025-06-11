Return-Path: <linux-kbuild+bounces-7458-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 750B6AD5797
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 15:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 166AB7A3CE9
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 13:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4483228AAE1;
	Wed, 11 Jun 2025 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WYdAW6iz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C52882A5
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Jun 2025 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650005; cv=none; b=eVdMJ9rOTeRZwTLAcn+02k+eRXCUOEvGWFAaJ/I7q68B183v5NDZg2HOwL1gWx+V8pz3Q4aYu8O3bYwGO9OhOqKDlnf8BNyHvxGQ8po1u/8tnp49gnxkrXcw/7gKlwOxp9BzS3aksOK/jZq1qfg58ZHV8DfR+qOPEXHDwo8d24k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650005; c=relaxed/simple;
	bh=9SIdAh840g6tydo2JznT4GeDVA5YXlZf24fa0jmn9oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xz00mNSvEN2zRH29yqKK/bbQ36rBOPOL51JzjJ+PoSjWloGxNPOB3l/+Qyk9tKHHCZ/JVQ3J9H92qabWkZ/6VFaB8O2GbdgCmNJaKaFz/yH0dC4cSCh4a8pM0Qv1DElSGYSxBkUiOruKYG//NxSDobETfBEs/AxL55dKnrXJOH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WYdAW6iz; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 11 Jun 2025 15:52:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749649990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4zq30Zx1gm5+DnliSP1IJP9mnbwAcrHCYpwo6PmyzBc=;
	b=WYdAW6izimj/1gDUnPW+moaf3Nr5+ezwcwuLHSc4IvraMglv8YBB9VUujsatvLjE7apE7p
	u9v5WzRBHxvmN01qtvUkfX2q9urcqWHuzQ2J9T3qKK3D1YvTQTqQ18DDnJz95VqMnpFJVF
	LrIlkoskO2W4MhCJ1lY8fuv0ZUIvBeA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH v3 01/16] kbuild: userprogs: avoid duplicating of flags
 inherited from kernel
Message-ID: <20250611-overjoyed-vengeful-goshawk-0aaf8c@l-nschier-aarch64>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-1-55e3d148cbc6@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611-kunit-kselftests-v3-1-55e3d148cbc6@linutronix.de>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Wed, Jun 11, 2025 at 09:38:07AM +0200, Thomas Weißschuh wrote:
> The duplication makes maintenance harder. Changes need to be done in two
> places and the lines will grow overly long.
> 
> Use an intermediary variable instead.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>  Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Nicolas Schier <n.schier@avm.de>

