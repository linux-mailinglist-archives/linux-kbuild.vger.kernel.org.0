Return-Path: <linux-kbuild+bounces-10782-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IOWKbBncWmaGgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10782-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 00:56:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3475FB9F
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 00:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0A9D24A5975
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 23:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F254508F4;
	Wed, 21 Jan 2026 23:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFgxsSFy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC71B421A08;
	Wed, 21 Jan 2026 23:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039781; cv=none; b=S2j50QfJeL4VY5tieDVCxEVMPAz3q8MVfwJI1ubt90plXLf0d54U6oJf6czJO//vCJbVREVQUut3I6VQURaqCfzgbk01lVsNsv2IpqCaoyb/YBxeVSiN1ErJ0LgVfGV4K2diphev9OhOvQ0BSrOrhyc14yae+PsNGxhZLWYn/No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039781; c=relaxed/simple;
	bh=TGmzJQxYNjTwc1evAvFZSARhHl6cW44HegJFImhXa0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ld4Jf2HzJwwoboSXWvCzW6+sY2RC5TlIRbCmMc1cPAbmvElcPcnTW1mcRcodb+SkQ41qsorpVdlqA7F9o634Ij/vNm2g2N4QyiAx8BZ1cDNtZ9aanQcRAs7Jsc52iT+SSXcF5U8s1rtdOwKJSphygDmbm0Motdly8CvRVQWW1Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFgxsSFy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4DEC4CEF1;
	Wed, 21 Jan 2026 23:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769039781;
	bh=TGmzJQxYNjTwc1evAvFZSARhHl6cW44HegJFImhXa0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFgxsSFyHLPuXXazm/yY7h2wWICHHfYZ9AQnPoIqED+aIpWmNvbrIRABEZ0tptNe3
	 T7HYKOFGn/6FSFlZPuSJ3E9Zon1uC3FrBeIzgTlhuDUIAq3nmvl83x4dA1haSH5/z/
	 PCJGVW8k/7dgI81iFtk4VQOlK43lzSq0TfVIcAwTCJmlKnUyyXQHdl/+5ePbM0jDOC
	 XxaF44qeUborkYetOMlVs+9UHTUmIhdWo2h7rIsaahNefFLYcSS+UvN/y7t/1P6zPA
	 IsK8A6FvKZ+2GfMAEFrnoC8CCMqjoAg9Y1HnBa+PwC40wODYiUu7Tgg559Glp89k/6
	 Z2A9QsWpSCw/g==
Date: Wed, 21 Jan 2026 16:56:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: linjh22s@gmail.com, Nicolas Schier <nsc@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Documentation/kbuild: Document gendwarfksyms
 build dependencies
Message-ID: <20260121235616.GA3887168@ax162>
References: <20260114-documents_gendwarfksyms-v2-0-297c98bd62c6@gmail.com>
 <20260114-documents_gendwarfksyms-v2-1-297c98bd62c6@gmail.com>
 <4d379736-9b6a-4e40-ad67-53ee7498759c@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d379736-9b6a-4e40-ad67-53ee7498759c@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10782-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lwn.net,google.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7A3475FB9F
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 01:17:48PM +0100, Petr Pavlu wrote:
> Nit: I suggest slightly adjusting the text to something like:
> 
> """
> Gendwarfksyms depends on the libelf, libdw, and zlib libraries.
> 
> Here are a few examples of how to install these dependencies:
> """
> 
> .. and swap the items on the pacman line to 'libelf zlib' so the order
> is always libelf, libdw, zlib.

I applied the following diff to this change and applied these to
kbuild-next.

diff --git a/Documentation/kbuild/gendwarfksyms.rst b/Documentation/kbuild/gendwarfksyms.rst
index 0e153d13b052..c5e4617b4b41 100644
--- a/Documentation/kbuild/gendwarfksyms.rst
+++ b/Documentation/kbuild/gendwarfksyms.rst
@@ -17,13 +17,13 @@ details about the final module ABI.
 Dependencies
 ------------
 
-libelf, libdw and zlib are dependencies of gendwarfksyms.
+gendwarfksyms depends on the libelf, libdw, and zlib libraries.
 
-Here are a few examples for installing these dependencies:
+Here are a few examples of how to install these dependencies:
 
 * Arch Linux and derivatives::
 
-	sudo pacman --needed -S zlib libelf
+	sudo pacman --needed -S libelf zlib
 
 * Debian, Ubuntu, and derivatives::
 

