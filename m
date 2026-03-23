Return-Path: <linux-kbuild+bounces-12168-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLgbNCRNwWmhSAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12168-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 15:24:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 303AB2F4660
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 15:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C970320C15B
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA883B19AF;
	Mon, 23 Mar 2026 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WC1BXcvm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576D43AE6E2;
	Mon, 23 Mar 2026 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274784; cv=none; b=ECInyzyfjzjNSwMlAmqCJzvz2T/XKr+EgzpKCmwebj4aRgPH874XI9mCs2kf3fOLFfbWXHGHted8Y+Z6xW4jw1KkbHTgV7LDTff18QtEXanriPxg2NhXGDseowpAP9WfzvUre1R4jYvRl5PLjQjeUj7aIJTvaAr6ZQjID2eVmcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274784; c=relaxed/simple;
	bh=lrAEia/zHrHkrV8/db4xENVDfDRL21RqR1IjVCxsyC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNqdvgRuvvYqin5/3QPOzfbxIq2+DcluvP2Mlx/W3ij5kEnhUiNKcAEouFOdmC0v0qcPie1xyZm7oc+dTX72Xx7MCL93AywmxoMvYhkFBCcx/9m+Qc0KVqcgA1Yh1q8gY5fBQZuchDrKWbHtQ03q3tdxkPwTUaHRDmXZFG6bPqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WC1BXcvm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19B2C4CEF7;
	Mon, 23 Mar 2026 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774274784;
	bh=lrAEia/zHrHkrV8/db4xENVDfDRL21RqR1IjVCxsyC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WC1BXcvmSSbdGEGLPvpyBX8HLabwq5iGVesEqgJ3+k0JOdenhtRXIDHlbTWfUrO5N
	 9hgAHy5Oefq95CyxFu/d8U//uqjHSlpB9V3bL68zHB5zqqyqRf3Vw4S0O+xP293Ddv
	 4vuRHpXVBqAAXpWEFRijJneXy4c77UG5rwU50aW9WNbbY4c+b1GuLZOduD5V5sUzjs
	 HfwlFwajaCqCNtV3udwn57L+sOTT64PPM2KrFlkvYrIOW26AV+bKufpNETWk+K0Vn5
	 0URvbC6qrgfPSfSVru2BLc/aS+iW+GaHxIihab5fHpLNoSNOXNxeI6GTMqD5Xz66h6
	 CN89ShUhkNaww==
Date: Mon, 23 Mar 2026 10:06:21 -0400
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Richard Weinberger <richard@nod.at>,
	Juergen Gross <jgross@suse.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Vlastimil Babka <vbabka@kernel.org>, Helge Deller <deller@gmx.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 0/4] kallsyms: embed source file:line info in kernel
 stack traces
Message-ID: <acFI3TfEtxz-r_Hi@laps>
References: <20260322131543.971079-1-sashal@kernel.org>
 <20260322093533.c0aab4ed9f5eef9536d14c21@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260322093533.c0aab4ed9f5eef9536d14c21@linux-foundation.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12168-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,nod.at,suse.com,linux-m68k.org,hansenpartnership.com,lwn.net,linuxfoundation.org,goodmis.org,infradead.org,leemhuis.info,gmx.de,ideasonboard.com,iscas.ac.cn,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 303AB2F4660
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 09:35:33AM -0700, Andrew Morton wrote:
>On Sun, 22 Mar 2026 09:15:39 -0400 Sasha Levin <sashal@kernel.org> wrote:
>
>> This series adds CONFIG_KALLSYMS_LINEINFO, which embeds source file:line
>> information directly in the kernel image so that stack traces annotate
>> every frame with the originating source location - no external tools, no
>> debug symbols at runtime, and safe to use in NMI/panic context.
>
>Sashiko review hasn't completed yet, but it has things to say:
>	https://sashiko.dev/#/patchset/20260322131543.971079-1-sashal@kernel.org

Nice! I looked at the comments, and I don't think that there are any changes
required as a result of the review. It asked good questions, but the concerns
are mainly false positives.

-- 
Thanks,
Sasha

