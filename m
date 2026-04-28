Return-Path: <linux-kbuild+bounces-12904-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAWNBfT88GnubgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12904-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 20:31:16 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E1148AA9B
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 20:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4032C3095536
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 18:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E234477E41;
	Tue, 28 Apr 2026 18:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r89B8JJ3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B01533D6F8;
	Tue, 28 Apr 2026 18:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777401067; cv=none; b=E7Lpfi8OgEevHBiS+2L3d3oM8kpmL53xiZw1MLBis3PQXhm5/bd5jGzcHEo034QAB4wiXaORPeMrUrx3WXho/4mUbnvqv4Hj/07bVLztP8NtYDYnfexRk8TNcoA5L3usLiGvptgcieVZrKHA/2uzDEuYkUNLTx8Wq+hQ47CewYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777401067; c=relaxed/simple;
	bh=x/1aO1xA/AqfD9ZptAL2EewwHZoY4UQtR9jQozIxzV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K44P73qcdVbRAzPcDUR7BDXItu5e2b9mdImlWDyA9bnHAsNTJ3FaGxFhT86y5MX9rzBOU0ZvnpRYisbbq4ClukxYs+apQJbGJA/PLmEn57KDveX7W9mRYBrvulPwmaQqNy1kv5qnuyC2c2uVUNtJEuQrDJziS/K39idgxJzcgG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r89B8JJ3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7F3C2BCB6;
	Tue, 28 Apr 2026 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777401067;
	bh=x/1aO1xA/AqfD9ZptAL2EewwHZoY4UQtR9jQozIxzV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r89B8JJ3nU1L7jeBW7hDVpY37BaqrXX7GXPw4/+4xn8OWBydZkfYhMtKwzHoPuclB
	 o7C/tF+iC4ds00oUhlhbxueEdCebBw6+nxJUIzDUnsCbiG58T4UN8GWmS7qXXOV3Zl
	 WLXtTHCTTKLPmTRxY5wUrilPFCxi/XTMVdOqJpG6gcacW0zQf8IA9m0aieF0jGWmxW
	 kWclp6tLfya8NneLYTouR0ltej5G8aRyKXXwpfUW/h04O0ntv7RzOLyZV+MNNpC19Y
	 noa0tqr/1PgGr1ceJloiuiCd9LvzANaPNFymHly5UxpstBSeLC9dnd1ww8ZUrHQXtc
	 sha7x5SeooF3A==
Date: Tue, 28 Apr 2026 14:31:01 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Julian Braha <julianbraha@gmail.com>, akpm@linux-foundation.org,
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
	masahiroy@kernel.org, nsc@kernel.org, ojeda@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] scripts: add kconfirm
Message-ID: <20260428183101.GA3304253@ax162>
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-2-julianbraha@gmail.com>
 <87mrynmuuu.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mrynmuuu.fsf@trenco.lwn.net>
X-Rspamd-Queue-Id: 74E1148AA9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12904-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,kernel.org,arndb.de,linuxfoundation.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 01:01:29AM -0600, Jonathan Corbet wrote:
> Also, a nit, but I would really suggest putting it under tools/ rather
> than in the scripts/ dumping ground.

As if tools/ isn't its own dumping ground? :)

While I can understand the desire to avoid adding more random stuff to
scripts/, it sets a confusing precedent because tools/ is not a part of
Kbuild, so I would not expect tools that would run within Kbuild to live
there (which this one appears to do). While there are obvious exceptions
such as objtool and resolve_btfids, I would like to avoid adding new
ones, which aligns with the comment added by Masahiro's commit
6e6ef2da3a28 ("Makefile: add comment to discourage tools/* addition for
kernel builds"). Maybe this could be mitigated with a tools/kbuild/
directory or something but not sure. Just some additional input.

Cheers,
Nathan

