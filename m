Return-Path: <linux-kbuild+bounces-13358-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNTKIlcAF2oJ0QcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13358-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 16:31:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 084215E5E78
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 16:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DBA330464BB
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 14:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0A942317C;
	Wed, 27 May 2026 14:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SqqP4Yjk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ksXDgpwI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F09B413256;
	Wed, 27 May 2026 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892002; cv=none; b=kWt/vjhC0TxlBPf0ijcFxQ73KxDZV4xqwQEcckk/D+dqT8iqAu1WA6Q5qR+WrSFfkGy+K8zcrCLx/aOmqRM1Z7D3dKiGkTU41dD3Gv1S51ez8vN4NYNbzHhZ7e1IPe7ZjTymE1z7lLWCQezzTi22RZwyswcinzDPQjJM4SAkRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892002; c=relaxed/simple;
	bh=OhcdtECHZLNfndhswLTlh0QREFCuYcNlHeP2kI2tq58=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=laTqyYequhZHLawOtPjCchgAbaIWAq4B6EafanwyLd2F36a0R5xDEprnshL+ykDmdx6wqaJYmtHLqJoin3yCxBVYsRqjcgR0CrMPi7TdyxvuAbyLVoXDm3OPRKgUCoSkRWRYMyOaDQCbCFBno+z0il4XBtGXNl5ATiMW3E6hkBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SqqP4Yjk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ksXDgpwI; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6C0DE1400086;
	Wed, 27 May 2026 10:26:36 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 27 May 2026 10:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1779891996;
	 x=1779978396; bh=yVrV+eG2Cdd8Z9o6gLUJZZWJZ89awpVCBEBkZBgWidc=; b=
	SqqP4YjkvnrgzHWUi0hFLySu/YM1b/C/TAtInZ3hatKDGS2dye2oMaFYkx1hqxXp
	ohZOyFiouCJQ+NjRUJb0A/GhRyq1nB7ZjutwdmlEDzYxQrbDYyHfow1ejdP7trJ9
	/8TagUrWLF/Z8vlBj9ZuO0p2t0Nye6UosiQ+L8VVAkjB72ADCzDbP+tfT3fu0H/F
	d3wL3PwCXLUfRaEJYq1cKxESNLgAZ+lGtNUPEsBPpxGjzAQLtS2cpVa96ewzcBwE
	v6SPh1VNqoP5RK117GdPUOLRU14pSs8bDNdu0Hyx/R2IGdJkSRE/J6bnH4leoIxn
	OKSaHvveya+bkxUUqGMjDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779891996; x=
	1779978396; bh=yVrV+eG2Cdd8Z9o6gLUJZZWJZ89awpVCBEBkZBgWidc=; b=k
	sXDgpwIX36vHZyjul8g2gZX7fVsi90DUPAskyHv+r3Sc5S1GEXaPLMsMvThGWWe1
	+45SLp5u88MTH+QovEEkpRhoyfuWsw7QKoAFzVz6RSontDnhh3Ngvjz+o4VklOHe
	vFlO73NzOh4Jc8Hbj9v5ydaIBIuEwj/P179CmPkzrlN8zieCpcIwKxWhcdaCqUKg
	xycFsakNBS7N/N0Y95cUQpSLqmsVvHXNd3fD8m8kO+HIqG++E+QwnYTmIftJnz5/
	xf3sD8K0SwUDfRVBuvlMiELJMeZy1k8h2ZbjmCwvovqHGhqGdwKMPWp7Oq3GEiG5
	jmXNolNccsiiexA4RST7Q==
X-ME-Sender: <xms:G_8Wak2tUVq5HmJRAx3sKRvYVVKEYHe6Gmq1PzNNQzhF9lEub1Rk1w>
    <xme:G_8Wap7LBDuTqanM_5CIlCDRuwUqerPnLZZ8LuIgN1n8KTq-y2-oHYSkr4qO2Z7ny
    AWQ6U3DyqAkAdfnKOitQop1DZnvTwrJJ4F8X6z-yu6HJc2BK6rvb00>
X-ME-Proxy-Cause: dmFkZTGtTCeZdU2a317hFG8sYU78jUzI8GDDMFFaBbMTSa/tLHbKzVQAnQnXKMaHqd6KZn
    vbK1aBAyKKts+Qt/DukkjmwqBQfLXj+ueAb3i+IzFckqlcFbSApQZ/g4XSHVdEbsmGSCmy
    fPmzOHLHiyrSQEOKSoI7F2q40JoSqmiDuwmcKYm551MCw82P2wh1Xq/Evrcf/Ys9GMo+bG
    nPOYJeYBgd5klNWn3cMqbWRHQCh6zTfyGzeDDoIeSaXZMi9MPz9dV3I2om566LyN1k0O9l
    5BHtb7nZqEmdarD0GRx+TqkSw3SDo2C+A5VI3WXLxEOen22HGTDEJ8nfBtJGh/3IRjLfkq
    o2Cqmrf5vfRDWEqruwsYY14fXYb5i7OgLOTq7OZK5wDcUvfCa8OKZ9t0jKwK1cwdVXAEEb
    BATa+rG0Hzib66xcYEIj1tPCMLQ2tPcY72f+2VgaC+LNJCfbrk0aQrrvcKVpGxadrBIOnC
    /dcq65axt+6I2CZN8R3OLT+eNV/zaEyJulDp4cB5bZ1qlmDBCdHwTVZTOSQxQVwyLa7YSF
    BSh+JkTXmiRq2tWJEXlraMAg5jzUVGP8yjkz0mdmCuTlDVIm4lcsCfw+Uy3Tn7iI1RpI6+
    ajVsciCRyU6M3em+pDXN9wdhf+eROzfrvpH+MKpqINix2bIqDLwRo9WrZ1cQ
X-ME-Proxy: <xmx:G_8Wai4vE9-OeuV4Os4crMERLsvmFYP-RrssrpyuYRTBZnW5I1YpGw>
    <xmx:G_8WalS2XGuPw3wD6Ix2BNxG6c8Y_cuK0mevpfOGRUdZgO8P6JX_qw>
    <xmx:G_8Wap9XuL9f3WUgk6xWfS1Y0bZ2hRh65pOxq4eOun18D_xbIOv0uA>
    <xmx:G_8WauqmAiViSS1fZSWdsoPKwXqSxQsAG1zIYHl9rsZQZya3WDEXjg>
    <xmx:HP8WaoxhBJrVQkn-3c3YAh-YBhJSE9cG6weS-DKbN22q0kT_DAAa6grg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6C443182007A; Wed, 27 May 2026 10:26:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A-HAwpsKkos7
Date: Wed, 27 May 2026 16:25:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Lobakin" <aleksander.lobakin@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 linux-s390@vger.kernel.org, "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Christian Marangi" <ansuelsmth@gmail.com>, linux-kernel@vger.kernel.org,
 "Steven Rostedt" <rostedt@goodmis.org>
Message-Id: <21f771b5-b8fe-4357-b081-ae83a39df485@app.fastmail.com>
In-Reply-To: <9398ee4c-3b51-4a00-a0d5-3674ce1b1081@intel.com>
References: <20260526101851.2495110-1-arnd@kernel.org>
 <b5e15330-ed64-4f31-bea2-bb877a24c1ce@intel.com>
 <8e50449f-66f0-4e85-aefa-7016697fe722@app.fastmail.com>
 <9398ee4c-3b51-4a00-a0d5-3674ce1b1081@intel.com>
Subject: Re: [PATCH] err.h: use __always_inline on all error pointer helpers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-13358-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,vger.kernel.org,kernel.org,linux.ibm.com,linux.intel.com,gmail.com,goodmis.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,arndb.de:dkim,messagingengine.com:dkim,app.fastmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 084215E5E78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026, at 16:06, Alexander Lobakin wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> Date: Tue, 26 May 2026 23:03:50 +0200
>> 
>> Without CONFIG_PROFILE_ANNOTATED_BRANCHES, the changes are
>> very small, with around 100 functions growing or shrinking
>> by a few bytes.
>> 
>> I don't think we care much about the size increase when that
>> option is enabled, but I do wonder what behavior makes more
>
> Yup, and even without this option, __always_inline is better here
> regardless of how it affects the size. Such oneliners must be
> transparent to the compiler

In general I would trust the compiler to make the right
choices here, but as I have shown it makes very little difference.

I think one case where an out-of-line copy may legitimately
be generated by the compiler would be when optimizing known
cold code for size and the compiler can show that the
out of line version is indeed shorter.

>> sense regarding the annotation for every single IS_ERR(). 
>> Does it make sense to have every instance get its own counter,
>> or would it make sense to actually try to reduce these
>> when profiling the annotations?
>
> I'm not familiar with branch annotations, but from the stats above, it
> really looks like it adds a lot of code bloat. Plenty of branches in
> the kernel are sorta pointless to track (the ones which trigger once
> in a thousand years, the unlikely() ones etc.), I guess.

Yes, the CONFIG_PROFILE_ANNOTATED_BRANCHES option definitely
adds a huge amount of bloat. The point here is to find
incorrect annotations, either a branch that is marked unlikely()
but taken most of the time or the reverse. I think
Steven Rosted enables the option occasionally to
see if there are any outliers, but nobody should use
this in production environments.

For IS_ERR(), it is fairly clear that unlikely() is the
correct annotation in almost all cases, and it's helpful to
mark all of the error handling as unlikely so the compiuler
can move it away from hot code paths. With 35000 instances
of IS_ERR() there are likely a few exceptions to this
rule, but I don't know if any of them are important enough
to require a code change. Steven might remember if he's
ever seen one here.

     Arnd

