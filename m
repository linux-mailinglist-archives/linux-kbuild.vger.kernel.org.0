Return-Path: <linux-kbuild+bounces-12244-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDF9FISsw2nAtAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12244-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 10:36:04 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA7C3224DA
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 10:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2BF830BBD09
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2026 09:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AD7351C07;
	Wed, 25 Mar 2026 09:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCNQphXg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF523337BA4
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2026 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431118; cv=none; b=aMTWxGwaa4s2+s6Ej0f6dm2YOSLDwWafVCqlCHT7o4OLstPehC1Nv6CiRIwq4gZd0lyO/B4iQ1kdty39IgQKuFseY7wXCfESCrBm4VrmLze46AaLXuzSEmOG7ijlwz48rC2ogHFMq8XZ9z54HWDvi7dQ4Bc5gpF/v/lKkBmG2ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431118; c=relaxed/simple;
	bh=w/hbKaEAf5xMVRyhYMppeW+IYPZFDrFUwVxsZEc+SsE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=dLvGt6BGY8NEP0VZcflRyVbp0QAH4tG7VvP/gqgYZ+umG6iUwPK1Svqyhf2BEqGqL7nYhlCO3SWyfcvLTKHVedhsQ1CAgE21pAvvvfZAllymOMMkey55q+7FqUU0zP1WfpNHlVT7mRPvn4x6GaEfAGkMFDxT3qZd7Z+AC0WWR8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCNQphXg; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso1264501a91.3
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2026 02:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774431117; x=1775035917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TF/+cxtFW65/t3CsODFg6Eg+Msha9EyFtJo/8aQf58o=;
        b=MCNQphXgbc8EpPzAuqYR8djm6txUWJstcMPwRNfsTZk6b22vUePuvsml+PJUK3mm76
         Lkow+Z82dj75WBS7/AA5c8i+Tr5QWwCvO3rRAZAhYLZ983FdJi/h8SQV9O7JB+SaQcAg
         CwkiIgU1OWgGBovJCAhscMIfL/QNgLZ+Q5VAArKhAMVlaRHXUjSBtNSsQKFEMUymHf8y
         kDYmx8nd7ephwuINvgjtBDyMaSYzZDpS/wIJOB7MzwDhWQzFKBHjCjduwobnkanxLXs5
         aI1q19ZknrG3abF/C91ofTS62I+Q4OIWQZQ5XoOX6yO6ya5BppJUWdkzGTnTptZzBtTO
         rOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431117; x=1775035917;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TF/+cxtFW65/t3CsODFg6Eg+Msha9EyFtJo/8aQf58o=;
        b=d8gQpeGdkAQM8IdJzGhsl6QtCo5L/b5QmH46eVC4EvGjrCyoSSs79rzFtw9MqoI590
         ofUTp8c2rZ/TT8HlJK3laQLxq75lllnVhHlR7HK3PIYrbVnWKabINRiI1sM/53R7AaZD
         2eLtt8Jt18oitzNMKn1c6Wp23ePprRNQ44v5hq/Hg0/NVZeFGfIqcI3brMO5A+1gtyeE
         1Qf6HnBV/f7mpGgEGds8J1ffjPCLtEw+8kGxmwfEWVRJQVDrngzOyHEooeWAed3MKNXr
         dJIBGPmUyyP1vGQhe+4e8irkLnDiOMMqNzO9jE/5Qy46wZ0LdPVZXHK7iYg1nWT6F6t/
         pSwg==
X-Forwarded-Encrypted: i=1; AJvYcCVWvDT8VDlcm7Xz5IteAW9a+OC9sYU3lirkHLkEkBXOeVpt/eikEqziQKMbaBW1+sW6zgqF/3NFfkUqIZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGroV4SfNQNtjgq98GHEBusOr/HHwSZ6BgRotGKPhFEAFpT/PO
	teEjBLTJwo3eJz+uPj++2Pupn21Mrg67CHFPovYAlfiRKJ3WmYqQVddq
X-Gm-Gg: ATEYQzx8bM83B1ORHfmNRRIHoJJCKLeHS97vCOGKxGCr969FPgfO2ZyIP6Bo1ONgmNF
	jwEyi4BjeLmzkxGYFjda2sC0zZinoIwh4OvPeoLtT6N2ApVnSKg8AU0w6gpQGeBJU231cFUg0/q
	n5gvZilt3ngk2Qjpw/Be4AIX89tdCsOgSSaO3TxzEhIFYfLuTUefmFj4/fA3t5/akH6+ukpgAZ1
	CqikyZ+Zddg5OSDWC/7Lew5AOfQyFmhgLy9pwSW/WFF+AKTrgCOW68sGIuprAKqNumy+0J/XqWQ
	3GV1jStm8/qXxhwgggA5pBSY9d+2JacbrW5+bE3vQtVUEwFaBjIsXnVtLeS8ykMxVgGSC++eMUL
	SQ3hGKxb0XeZxdVFzuL2gt7l+dNzasoTh3OdjgLOPw0h5EDdRRqP5I9kg+UywXFEGaUdmpOVN4K
	JTpLoYaLRxVctDTPp6Fy67VP+FyLc66mnR
X-Received: by 2002:a17:903:37cf:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2b0b0a48b14mr30087295ad.23.1774431117028;
        Wed, 25 Mar 2026 02:31:57 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0b0129905sm25660755ad.27.2026.03.25.02.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:31:56 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, masahiroy@kernel.org, linux@weissschuh.net, tamird@kernel.org, rostedt@goodmis.org, ihor.solodrai@linux.dev, maddy@linux.ibm.com, peterz@infradead.org
Subject: Re: [PATCH v2] char: nvram: Remove unused nvram_mutex to fix -Wunused-variable warning
In-Reply-To: <e6db8617-6b12-4f90-967d-85c9f7805823@kernel.org>
Date: Wed, 25 Mar 2026 14:34:04 +0530
Message-ID: <7br0nuuz.ritesh.list@gmail.com>
References: <20260323073220.25798-1-venkat88@linux.ibm.com> <e6db8617-6b12-4f90-967d-85c9f7805823@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-12244-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0EA7C3224DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> writes:

> Le 23/03/2026 à 08:32, Venkat Rao Bagalkote a écrit :
>> v2:
>>    - Added missing Suggested-by tag from Ritesh Harjani (IBM)
>> 
>
> Patch history must go _after_ the --- below, otherwise it will appear in 
> the commit message when applied, which is pointless.
>
>> drivers/char/nvram.c defines a static mutex 'nvram_mutex' which is never
>> used. This results in a compiler warning on linux-next builds:
>
> It is probably not only linux-next builds, I think the problem exists 
> since 20e07af71f34 ("powerpc: Adopt nvram module for PPC64")
>
>> 
>>    warning: 'nvram_mutex' defined but not used [-Wunused-variable]
>> 
>> Remove the unused definition to avoid the warning.
>
> It is not what you are doing.
>
> You are just hiding the probleme by saying 'maybe it is used, maybe it 
> is not used, I don't know I don't care".

Venkat, do cares about this warning, and hence he sent the patch in trying to fix it ;)
I think, I missed seeing the upper #ifdef block of PPC, and hence
suggested him to use __maybe_unused, instead of complicating it
further with...  #if defined(CONFIG_PPC32) || defined(CONFIG_X86) || defined(CONFIG_M68K),

> Please properly fix the problem instead.
>

I agree, make sense.

> I think the fix is probably to remove the #ifdef CONFIG_PPC32 around 
> IOC_NVRAM_SYNC.
> If you think it is important to return -ENOTTY on CONFIG_PPC64, just add:
>

That make sense and I should have thought of that.

However, I looked at the suggestions from Arnd, and I too agree that all
underneath function operations already do their own locking, so I agree
that we could just kill this nvram_mutex lock itself.

-ritesh


