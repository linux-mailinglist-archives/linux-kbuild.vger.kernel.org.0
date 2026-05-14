Return-Path: <linux-kbuild+bounces-13162-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Jx7EulCBmqWhQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13162-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 23:47:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D7254727D
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 23:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31D2D3011BEB
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 21:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2243921E4;
	Thu, 14 May 2026 21:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b="ulsz5YT9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.freenet.de (mout.freenet.de [194.97.204.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CFE2DEA6B;
	Thu, 14 May 2026 21:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.97.204.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778795214; cv=none; b=bCPVtAVYuZQ6F0z544s3gu7LE7xex+wQPYEQ7VOXCQZCBKo4kWtzodqcazMa7T1zNk//FkctJ6w+OD+/ai8T1f08hbRDxcb6Mxexj8W982R1BXul7JLrOygIcO7f8n33fzohsLxNiA980+IWY3Sf1ZlkLKptZ2f9/IlP/IlDPKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778795214; c=relaxed/simple;
	bh=veVSEXVJ6Q5ddh0VuttcCpPQIr0Bwm6dgdTEvG4gEqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1mYtO8i5yeEmtE52eTvGxQ0o2bXEPv25ychBY9NcMjONaPZdGcVRhDbjVRIj+ljbTXhrNR+0G+E4t32M9ADBggzVr8wfHoblVh3RzeqiqtJu4eTPXv6m6Zgp9w0D5pVZKimBo2FEAc+gbndk6V/U2l1vNgw0M7LRMCloAw1eek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenet.de; spf=pass smtp.mailfrom=freenet.de; dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b=ulsz5YT9; arc=none smtp.client-ip=194.97.204.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Received: from [2001:748:400:2319::5] (helo=sub8.mail.fnrz.de)
	by mout2.mail.fnrz.de with esmtpa (ID viktor.jaegerskuepper@freenet.de) (port 25) (Exim 4.98.2 #2)
	id 1wNdtD-0000000AZoA-09LO;
	Thu, 14 May 2026 23:46:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=jlzr0g4jR9iZt1q75zv+hpNOZ87/5VQyOSeF+F7qTAs=; b=ulsz5YT9viXxhGV6rxIvKQeR0z
	y1GhInjA8Ca7YTPpwGztDD1WQYojLcepmhUQv1lIYqYsFqZf36SlOTjMMhlMIdwUo2q4HInot+J09
	Fk3B+o+t4SX24uSEynUlxPr8VpCxDTD45oRA8LGReHkMdffVVEOEVUZAr9dvgifbdon+wpPId1Hi1
	rpAnC9kDLmw1rtZUpCqtj+FwV9DwDvO/bKyIwR//ZWz6adhDi75GfANqEIcJkc2gX+YkLGIaZgw77
	jsLVS5zh9OdyoxQcKz4art9YmmpIWUk7mMR31cXIdO+hvhEUSXpsdLJLBVeYPEkg6wlpplgNLfEoh
	3AFO/Xqw==;
Received: from [2a02:8071:a85:f020:8de4:42bc:8f23:736f] (port=43970 helo=[127.0.0.1])
	by sub8.mail.fnrz.de with esmtpsa (ID viktor.jaegerskuepper@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim 4.96 #2)
	id 1wNdtC-007C1a-2u;
	Thu, 14 May 2026 23:46:42 +0200
Message-ID: <5d5f8ee1-9615-4624-9606-97a6d0943785@freenet.de>
Date: Thu, 14 May 2026 23:46:57 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: pacman-pkg: make "rc" releases adhere to pacman
 versioning scheme
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Christian Heusel <christian@heusel.eu>, Nicolas Schier <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513231745.51780-1-viktor_jaegerskuepper@freenet.de>
 <177876476891.305249.12721845256238248028.b4-review@b4>
From: =?UTF-8?B?VmlrdG9yIErDpGdlcnNrw7xwcGVy?=
 <viktor_jaegerskuepper@freenet.de>
In-Reply-To: <177876476891.305249.12721845256238248028.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-FN-MUUID: 1778795202338BBDD3DD1DO
X-Scan-TS: Thu, 14 May 2026 23:46:42 +0200
X-Rspamd-Queue-Id: A2D7254727D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[freenet.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[freenet.de:s=mjaymdexmjqk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13162-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[freenet.de:+];
	FREEMAIL_FROM(0.00)[freenet.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viktor_jaegerskuepper@freenet.de,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,freenet.de:email,freenet.de:mid,freenet.de:dkim]
X-Rspamd-Action: no action

On 5/14/26 15:19, Nathan Chancellor wrote:
> On Thu, 14 May 2026 01:17:29 +0200, Viktor Jägersküpper <viktor_jaegerskuepper@freenet.de> wrote:
>> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
>> index 452374d63c24..fe629074b4e8 100644
>> --- a/scripts/package/PKGBUILD
>> +++ b/scripts/package/PKGBUILD
>> @@ -10,7 +10,7 @@ for pkg in $_extrapackages; do
>>  	pkgname+=("${pkgbase}-${pkg}")
>>  done
>>  
>> -pkgver="${KERNELRELEASE//-/_}"
>> +pkgver="$(echo "${KERNELRELEASE}" | sed 's/-rc/rc/;s/-/_/g')"
> 
> Sashiko notes [1] (with a contrived example) that this could result in
> custom localversions being matched and adjusted. While I don't think it
> is that big of a deal given how specific the example is, it takes little
> effort to make the match more restrictive to make such a situation less
> likely:
> 
>   pkgver="$(echo "${KERNELRELEASE}" | sed 's/-\(rc[0-9]\+\)/\1/;s/-/_/g')"
> 
> [1]: https://sashiko.dev/#/patchset/20030

I agree this is much better. Actually I should have looked at the
script "mkdebian" for Debian packages which has this line:

upstream_version=$("${srctree}/scripts/setlocalversion" --no-local "${srctree}" | sed 's/-\(rc[1-9]\)/~\1/')

This is incorrect for the (hopefully rare) case that we have 10 or more
"rc" releases, but that can be fixed in another patch.

Best regards,
Viktor

