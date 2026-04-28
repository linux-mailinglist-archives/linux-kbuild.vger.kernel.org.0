Return-Path: <linux-kbuild+bounces-12894-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKsiFxIJ8GkINgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12894-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 03:10:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C9047C505
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 03:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEED3304D722
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 01:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBC32C0261;
	Tue, 28 Apr 2026 01:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VxqTwDh/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F01B1DE8AD;
	Tue, 28 Apr 2026 01:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777338568; cv=none; b=iv+6PU7rm/pFIHTwe5gUjGw3WfBONBgUoQo3N+FomFIOUgKxdDtZHqHfDDu+3L1JzE7q2pCBCN59yNKTv56mUzXu3M9s5gVD8XDeMxhmXVe3FYknqaGHerE2FWBJ2j6pzlN4Y6NGJ7ywCwxovpj7PRNwKcoVK9HSKQuh7DVv6+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777338568; c=relaxed/simple;
	bh=L03C5cddUO+3zqFMyNSF/fyjRd0ZkwQzjKIqNnW/Szo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vGXSG5juSNYKXJvXyGIuv4MIcSIfb0avEyyWRdm4MlwwIcp+DRzTgXLV+iKbKlfHBDFHcIQn+c+wbRkKDtc+VurbcoNEJpcHc1HNTvE95m1cs2paqSn6GpdDcRiIOcYBroXcCV/BYOtzIj36/QM3uiddjhoLzM4d1I9BxEgpOsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VxqTwDh/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=s/UEy9bu3dYyuKKyiTmyWaOAbvsOAArDjPmqRPG7fkI=; b=VxqTwDh/bGx16uKrvSmsA3+BgI
	AOiFGO/cXd/fptjASBEKU12WeA/ulKoKvzovZQreVdPHtnE/6V6kHLcL2tA2eRDOOLxGwHmnfl80B
	Z9I8Fn89xGpj74O4Am339bjN9TEcMsO2BSC2U4iVtUL3kaZi6g3GycrqH8Mfg/Otc52LTOvdy/wzX
	Mf3WI4ZWNHl2XDEt69uRbyGrCPvz/Me5MFRkEFqLIcxYcgiCtMzz4BAfryTFcHxtwhOroxJ1y8A3c
	aRGf0AzlUQmXuNKS/xayHMJ2jJvjuRFB/bZTYKhGoDT8fQJAWh/0jaELT3cH2hJBOKhDRFTQjAmyf
	uogEmggA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWwu-00000000NC4-0kOO;
	Tue, 28 Apr 2026 01:09:16 +0000
Message-ID: <7654454c-a4d1-41a8-8c46-f2cdd6582a4a@infradead.org>
Date: Mon, 27 Apr 2026 18:09:15 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] modpost: prevent stack buffer overflow in
 do_input_entry()
To: Hasan Basbunar <basbunarhasan@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260427204255.22117-1-basbunarhasan@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260427204255.22117-1-basbunarhasan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 28C9047C505
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12894-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email,infradead.org:dkim,infradead.org:mid]

Hi,

On 4/27/26 1:42 PM, Hasan Basbunar wrote:
> Several functions in scripts/mod/file2alias.c build the module alias
> string by repeatedly appending into a fixed-size on-stack buffer:
> 
> 	char alias[256] = {};
> 	...
> 	sprintf(alias + strlen(alias), "%X,*", i);
> 
> In do_input_entry() this pattern is unbounded across nine bitmap
> classes (evbit/keybit/relbit/absbit/mscbit/ledbit/sndbit/ffbit/swbit).
> The keybit case alone scans bits from INPUT_DEVICE_ID_KEY_MIN_INTERESTING
> (0x71) to INPUT_DEVICE_ID_KEY_MAX (0x2ff), which is 655 iterations; if
> a MODULE_DEVICE_TABLE(input, ...) populates keybit[] densely, the
> emission reaches ~3132 bytes — overflowing the 256-byte buffer by
> about 12x. include/linux/mod_devicetable.h declares storage for the
> full bit range ("keybit[INPUT_DEVICE_ID_KEY_MAX / BITS_PER_LONG + 1]"),
> so the worst case is reachable per the ABI.
> 

do_input() is the only do_function() that accepts such a large array "arr".
Did you look at the other do_functions() and conclude that there are no other
issues?
I wonder how large an alias do_dmi_entry() could produce?

> No driver in the current tree triggers this — every in-tree user of
> INPUT_DEVICE_ID_MATCH_KEYBIT populates keybit[] very sparsely (1-3
> bits). The concern is defense-in-depth: the unbounded sprintf is a
> silent stack-corruption primitive in a host build tool, and the buffer
> size has not been revisited since this code was added in commit
> 1d8f430c15b3 ("[PATCH] Input: add modalias support", 2005).

Maybe Fixes: that?

> Reproduced under AddressSanitizer with a stand-alone harness mirroring
> the do_input loop on a fully-populated keybit:
> 
>   ==18319==ERROR: AddressSanitizer: stack-buffer-overflow
>   WRITE of size 2 at offset 288 in frame [32, 288) 'alias'
>     #6 do_input poc.c:44
> 
>   Stack-canary build:
>   Abort trap: 6  (strlen(alias)=3134, cap was 256-1)
> 
> Add a small alias_append() helper around vsnprintf with cumulative
> bookkeeping. It calls fatal() on overflow, matching the modpost style

I probably wouldn't call that cumulative accounting.
It takes strlen(current alias) each time that it's called.
(but this is just a nit :)

> for unrecoverable build conditions. do_input() takes the buffer size
> as a new parameter; do_input_entry() passes sizeof(alias) at every
> call site. This bounds every write into the on-stack buffer and turns
> the latent overflow into a clean build error if it is ever reached.
> 
> Reported-by: Hasan Basbunar <basbunarhasan@gmail.com>
> Signed-off-by: Hasan Basbunar <basbunarhasan@gmail.com>
> ---
>  scripts/mod/file2alias.c | 70 ++++++++++++++++++++++++++++------------
>  1 file changed, 50 insertions(+), 20 deletions(-)

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Tested means that the before & after versions of
modules.builtin.modinfo are the same.

-- 
~Randy

