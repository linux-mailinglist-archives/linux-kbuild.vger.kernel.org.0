Return-Path: <linux-kbuild+bounces-13183-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id st9CIXQSCWpUHgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13183-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 02:57:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A7455ED34
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 02:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4BCF300E620
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 00:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1A2218AB9;
	Sun, 17 May 2026 00:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b="uPe3JTCS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.freenet.de (mout.freenet.de [194.97.212.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C711870830;
	Sun, 17 May 2026 00:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.97.212.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778979439; cv=none; b=GSs/AWP+npmRSrEkYO7ygWaHWfraTzmY8e+Vwr0uT9YQTiwzK1Z/sfufaNOqzbvNdwsJDuAqPVi40Eleop9+upQWRZWII2EyahVYOIQDmJSf/DCQAGQ+6x7gHdC+GpmYRY9xne+UKogMsUSpriVszlLWYf406PgjwUR8p9lZDFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778979439; c=relaxed/simple;
	bh=0+LaReUh13zI5I19M0FCwDRtQ4T1sezVkVmkAb0aEw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gm358yll2EtjyvPZ8tWpGAI1Cc2ur2CMDwTZkb4Eb2BTExIrE8yOFtHpG+khY7IL4eQFH3UeuNyC8m4Op5rARLNw//TGGNbRhWSCgMcaqlkm96N5mT8DBb/rvs04mFiL/tM1w0o511H4b0bjdOSJPGv060JPC1EnowfeWmR3Hj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenet.de; spf=pass smtp.mailfrom=freenet.de; dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b=uPe3JTCS; arc=none smtp.client-ip=194.97.212.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Received: from [2001:748:400:3319::5] (helo=sub9.mail.fnrz.de)
	by mout3.mail.fnrz.de with esmtpa (ID viktor.jaegerskuepper@freenet.de) (port 25) (Exim 4.98.2 #2)
	id 1wOPob-00000006Wqx-0wNw;
	Sun, 17 May 2026 02:57:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=r4C8D5wuHV9lwPSiNeD7/HKyhj8sn9HHwzrPMWPWZls=; b=uPe3JTCSLtvTC3tPINwxGaOW+r
	7wGfwYFKu66K/vhIQSnJ1L1UzR3BuDhLrIy6niMNkPmOuIq4GzKxS7a86Vci8axZNnhvvhVnnJWg3
	rku3CsQGnFlgdQtcO5c6n/03KWcVSb6+Wgz2029fwi4cmfGIbCnPj2s7ViM3/t/dnU9Qfgo3RFjrE
	OubilqAydjFqtdksL/7y0uFKoJY0L5keLUk3YpkwjOvytZG/jwmXXygFIWfT6Kovr8Kq0iqr16V6E
	5f4R58nyABwBBeiV97tua8hm5t91Ev/AiumEWnsjdMCZV4SYkMlV5vfEWUhtGCBnyvJoaKMHrCRT0
	czIQyk6g==;
Received: from [2a02:8071:a85:f020:d23b:4d27:e558:ccdc] (port=39318 helo=[127.0.0.1])
	by sub9.mail.fnrz.de with esmtpsa (ID viktor.jaegerskuepper@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim 4.96 #2)
	id 1wOPob-009soc-0F;
	Sun, 17 May 2026 02:57:09 +0200
Message-ID: <b882a024-f209-40df-ab5c-f212c1f43c7d@freenet.de>
Date: Sun, 17 May 2026 02:57:07 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kbuild: pacman-pkg: make "rc" releases adhere to
 pacman versioning scheme
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Christian Heusel <christian@heusel.eu>, Nicolas Schier <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515215913.92481-1-viktor_jaegerskuepper@freenet.de>
 <bbed7fb2-11f7-4396-a89d-881972565f06@freenet.de>
 <20260516153317.GA311940@ax162>
From: =?UTF-8?B?VmlrdG9yIErDpGdlcnNrw7xwcGVy?=
 <viktor_jaegerskuepper@freenet.de>
In-Reply-To: <20260516153317.GA311940@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-FN-MUUID: 177897942939DF22B21DBDO
X-Scan-TS: Sun, 17 May 2026 02:57:09 +0200
X-Rspamd-Queue-Id: D3A7455ED34
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[freenet.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[freenet.de:s=mjaymdexmjqk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13183-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,freenet.de:email,freenet.de:mid,freenet.de:dkim]
X-Rspamd-Action: no action

On 5/16/26 17:33, Nathan Chancellor wrote:
> On Sat, May 16, 2026 at 04:27:39PM +0200, Viktor Jägersküpper wrote:
>> On 5/15/26 23:58, Viktor Jägersküpper wrote:
>>> The package versioning scheme does not enable smooth upgrades from "rc"
>>> releases to the corresponding stable releases (e.g. 7.0.0-rc7 -> 7.0.0)
>>> because pacman considers that a downgrade due to the underscore in
>>> pkgver (e.g. 7.0.0_rc7), see e.g. vercmp(8) for an explanation of the
>>> package version comparison used by pacman. Package versions which are
>>> derived from said releases (e.g. built from git revisions) are
>>> similarly affected. Fix this by modifying pkgver in order to remove the
>>> hyphen from kernel versions containing "-rcN", where N is a
>>> non-negative integer.
>>>
>>> Acked-by: Thomas Weißschuh <linux@weissschuh.net>
>>> Signed-off-by: Viktor Jägersküpper <viktor_jaegerskuepper@freenet.de>
>>> ---
>>> v1 -> v2:
>>> - make the substitution more restrictive
>>> - enhance commit message accordingly
>>> - add Acked-by tag
>>>
>>> v1: https://lore.kernel.org/linux-kbuild/20260513231745.51780-1-viktor_jaegerskuepper@freenet.de/
>>>
>>> BTW this also works for something like "5.10.248-rt143-rc1" which is a
>>> recent example of an "rc" release of a realtime kernel.
>>>
>>>  scripts/package/PKGBUILD | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
>>> index 452374d63c24..1213c8e04671 100644
>>> --- a/scripts/package/PKGBUILD
>>> +++ b/scripts/package/PKGBUILD
>>> @@ -10,7 +10,7 @@ for pkg in $_extrapackages; do
>>>  	pkgname+=("${pkgbase}-${pkg}")
>>>  done
>>>  
>>> -pkgver="${KERNELRELEASE//-/_}"
>>> +pkgver="$(echo "${KERNELRELEASE}" | sed 's/-\(rc[0-9]\+\)/\1/;s/-/_/g')"
>>
>> I will send a v3 patch later with the first substitution changed to
>> match "-rcN" where N is a strictly positive integer because this is
>> what we really had in the kernel so far, at least as far as I can
>> remember.
> 
> Do you mean dropping the '\+' portion of the regex? If so, I think I
> would rather keep what you have here since while an -rc10 is incredibly
> unlikely nowadays (we pretty much never go past -rc8), it has happened
> once before in 3.1:
> 
>   $ git tag -l | grep -- -rc10
>   v3.1-rc10

I was only concerned about 'rc0', so I came up with this:

's/-\(rc[1-9][0-9]*\)/\1/;s/-/_/g'

For 'rc' releases starting from 'rc1' this matches '-rcN' where N is a
strictly positive integer. Since 'git tag -l | grep -- rc0' shows
nothing, I assume that there is an unwritten rule that counting from 1
is the correct choice for kernel 'rc' releases. :-)

Compare that to the Debian substitution code: 's/-\(rc[1-9]\)/~\1/'
> We can leave the Debian case you pointed at earlier the way it is for
> now but if we are making a change here, we might as well make it as
> future proof as possible. If you (or others) really feel strongly
> otherwise, feel free to ignore me :)
Actually I have no preference. If there is consensus that the regex for
strictly positive integers is better, I can send a v3 patch. The Debian
code can be adjusted in a follow-up patch.

BTW I forgot to mention that this patch also addresses the stable 'rc'
preview releases which also start from 'rc1'.

Best regards,
Viktor

