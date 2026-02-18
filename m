Return-Path: <linux-kbuild+bounces-11327-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oB83JwGdlWkESwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11327-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 12:05:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1B4155C95
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 12:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B1943019CAA
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 11:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DE6307AF0;
	Wed, 18 Feb 2026 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kxxt.dev header.i=@kxxt.dev header.b="Ei5r45Rj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.kxxt.dev (mail.kxxt.dev [74.48.220.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3BB308F33;
	Wed, 18 Feb 2026 11:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.48.220.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771412734; cv=none; b=tDvfKLoJNpRC2AkVSS/dyrVK/diVjmqluLqsQxCOvfx6QW+gvMpFzmWZ8UqwzE681392u6GJ32XlCfnaGWBKNyd7uUxi99KoX1XooV0vWJgxHuAEWc8Xy1atyMyR5ZA3F08QbPPFWn+KQGrGtg8OJDdNW+wFxGELb1sTV6vfevA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771412734; c=relaxed/simple;
	bh=y4QkE3CZUnu/oKIHxzrejHqPBUCOGyUkRqc61SSuP3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skWVEki6+jEI+I+9LXNEJS0oca3rZkr8xAwBxafTei2g3qJSXX4HH/brEHQsJF9GNTyE5uDE9lsa7VQgL/MbgVvECqsvL49bC1VcNqzPODDHBC90tvqt8zsIEHLAqDRRh7ipUHNPT/ka9Sg7DqOeK9ifvsfuG1p8zmCUP+9Ic8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kxxt.dev; spf=pass smtp.mailfrom=kxxt.dev; dkim=pass (1024-bit key) header.d=kxxt.dev header.i=@kxxt.dev header.b=Ei5r45Rj; arc=none smtp.client-ip=74.48.220.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kxxt.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kxxt.dev
Message-ID: <d1a55d2d-b2b6-4763-a6b6-c7aa843c43ac@kxxt.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kxxt.dev; s=mail;
	t=1771412244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4ZvNDH5CJF2VNxy9ozaokK1FVsUVUjM80vtniXkAvY=;
	b=Ei5r45RjyWpWrKxmfWpBe+frKH6AtJb7HfbAl1xlnDBUuyCkWLcTCDtMNmeoG4kFzaJuT4
	Ex0hOprzR4jJSgZDhx9vxP0hKJnJsbG/cQKlfOZRMtMD8noNexGfgFFoKgqDVaKnfwyYuU
	CIP1Ez4LX66PQn37+zh2LVAbowvaJGs=
Date: Wed, 18 Feb 2026 18:57:18 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] tools build: Fix rust cross compilation
To: Dmitrii Dolgov <9erthalion6@gmail.com>, linux-perf-users@vger.kernel.org,
 Ian Rogers <irogers@google.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
References: <20260218084736.33114-1-9erthalion6@gmail.com>
Content-Language: en-US
From: Levi Zim <i@kxxt.dev>
In-Reply-To: <20260218084736.33114-1-9erthalion6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kxxt.dev,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kxxt.dev:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11327-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,google.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kxxt.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@kxxt.dev,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kxxt.dev:mid,kxxt.dev:dkim,rust-lang.org:url]
X-Rspamd-Queue-Id: 1C1B4155C95
X-Rspamd-Action: no action

On 2/18/26 4:47 PM, Dmitrii Dolgov wrote:
> +    RUST_TARGET_FLAGS_riscv	:= riscv64-unknown-linux-gnu

riscv64-unknown-linux-gnu is not a valid rust target triple.
It should be riscv64gc-unknown-linux-gnu [1] if this is applied to build user-space Rust binaries.

[1]: https://doc.rust-lang.org/beta/rustc/platform-support/riscv64gc-unknown-linux-gnu.html

Best Regards,
Levi

