Return-Path: <linux-kbuild+bounces-12331-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /m5vGamKyGlEnQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12331-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 04:12:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC623506E9
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 04:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C39623006219
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 02:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202B82248B3;
	Sun, 29 Mar 2026 02:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="DDOwpLKC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster1-host9-snip4-2.eps.apple.com [57.103.76.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05FE21C173
	for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2026 02:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774750369; cv=none; b=K8qtC/fgedCQ5axqZ3NTH8zdmYBG9813nG85F8ARc/8laNzDNbyioRasfJ7Wnwf5CoHFVsCcM14BhQzQkYLkfEn8rFdAhqHs7NdCaznpRsFpJ7b0UfWmeSRxu8GN3t7wCijCICB9MjENtyKyG6x6cTVb4cTsdEo2qi9dDK3zJ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774750369; c=relaxed/simple;
	bh=G4NI8qcFNsyigL4gtjDc3G+DgqLy1v2FNvfTTa16O3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdiB0vBtPLXF7tRI7i25ndzVLBJ1ZdFy4ygW3uorptY40SHzuzP1+HVEYwBG9+48/EnCsc8Anma8bRC9BVUVMI9W1IXn8EwjfgDQ8/6S59V1MKRHzPMLpKqctrRcD+lwqGxKhSlqwBHnd+/0VeHDRF8jPArZZg/hfDUM5TOkOhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=DDOwpLKC; arc=none smtp.client-ip=57.103.76.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-1 (Postfix) with ESMTPS id 0D9D318000AD;
	Sun, 29 Mar 2026 02:12:45 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1774750366; x=1777342366; bh=Q7gRQtRI4BUed2ZKylsfnAfjyn9+VyaMFUDh7obfvb0=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=DDOwpLKCADS1W1oqDBZU3hkcaiT6kyW3jNNcLN+zVSxETO2E8VBkxtHffk3tS99ungY3uKMNc/rYbDpezYjb5asUTF7qEKfZW1lqUAVrH6nQPgx2ZFXgxAa5WhYrGzuMbPsZjyGoaaA+q85HTba11uzzVkARWPC9GWHcS5eaROaoEo/treWnm1UhbIF2rDggvpIcVEi5hiW6d5PJUKUB1D6y/GI/OivnHp3kaFnBge7nyc6Sl24dfGkgWiL5ylZO2qMv8FLm4O/mVPV38GJnK1xL7lupBRKVXJnO96LhRYQwdFb6LJK51dcS2gHYPUJvJ44/4ce2rKnae2f71+OLmg==
mail-alias-created-date: 1772007648188
Received: from sdhn.cc (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-1 (Postfix) with ESMTPSA id 1F8CD18001F3;
	Sun, 29 Mar 2026 02:12:43 +0000 (UTC)
Date: Sun, 29 Mar 2026 05:12:41 +0300
From: Mohamad Alsadhan <mo@sdhn.cc>
To: Nicolas Schier <nsc@kernel.org>
Cc: nathan@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [PATCH v5] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <v5gmt4ujqfr4xjxdzkmxo2qwehglc3btvhliyqcxr2npazhuwe@potf3itpqdzn>
References: <20260317112021.14353-1-mo@sdhn.cc>
 <20260321150034.9915-1-mo@sdhn.cc>
 <acOgkfn-cOOy2YNG@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acOgkfn-cOOy2YNG@levanger>
X-Proofpoint-ORIG-GUID: _fRyG605o8OVznpy8ePA6uyVovFA4B7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDAxNCBTYWx0ZWRfX1JfnKkPIfNRu
 LVIieNTmgWQOtlLx9uVgxDkFro2Q/Rf2bGmHloc8A855sOeP3SITMgbm/sD3rcOsyewS2QJdUzu
 POj/fOyx8jkWB3q8ASk+JADbI1lFV1CsZapXejRgbxuhzJRs6O5ccUu1PLpPlyqgcd0UPsv1ZMc
 +xcGK+I5NO6hnY46lhk7+HatRrdA8Ar2eNvdn/pDW224mO9f9Q/WUJ+ytJ5Dta2bITXY0ZhVGCR
 R5ZVvQlp6HfLAfXVUYZtaUlzpWawZwYEOf1qiTpecbIR2OrmKOyfAyN4l3mpSnOmkkr4DhdQs5I
 HIuXC0IDko6fJqhG8WcOtVQEa+HmpYV4sI89ka1RD79v5NaYG/I6cT6ELJQQzw=
X-Proofpoint-GUID: _fRyG605o8OVznpy8ePA6uyVovFA4B7q
X-Authority-Info-Out: v=2.4 cv=deiNHHXe c=1 sm=1 tr=0 ts=69c88a9e
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=xoJtUOapyJQZxyFlaFgA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1030 mlxlogscore=690 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603290014
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[sdhn.cc:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[sdhn.cc:+];
	TAGGED_FROM(0.00)[bounces-12331-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sdhn.cc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mo@sdhn.cc,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5DC623506E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Nicolas,

On 26/03/25 09:45am, Nicolas Schier wrote:
> Unfortunately, I overlooked the missing entries for 'clean'/'mrproper'
> and scripts/.gitignore.  Is it ok for you if I the following diff to
> your patch?

Please go ahead, I missed those as well. Thanks for catching that!

I also missed another instance where the linker is passed to `RUSTC`,
in `rust/Makefile`, as Yoann pointed out. So it's worth considering
adding the fix in there too.

Happy to send an updated patch with the missing bits if you'd prefer,
but I'm also fine with you folding it in.

Best,
Mo

