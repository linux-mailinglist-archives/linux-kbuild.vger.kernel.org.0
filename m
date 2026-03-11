Return-Path: <linux-kbuild+bounces-11859-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HtHNGQ7sWkLswIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11859-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 10:52:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7826326151E
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 10:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 281293094D73
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 09:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BED43C1992;
	Wed, 11 Mar 2026 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="zOMJcvIb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outbound.mr.icloud.com (p-west2-cluster2-host5-snip4-3.eps.apple.com [57.103.68.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E6734CDD
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2026 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773221731; cv=none; b=kcx1CdanpWgcem9bD0ays+IX1mZkwVQg1/PIl6h3SoKhK9zVuU4B6ksR1U1i2/1PM4PbWQofZyRQr6AmMTvYk/24WPnHO0YI/7h6YX55U0+IdFm3vcuniiF6I271kZMtLPyd/nyFs+xW9sGuViwZnlkpVCjigmg3+0U2a6k82DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773221731; c=relaxed/simple;
	bh=97wy5PMZjTkPrSXqc3Cf0lsjK9tMbtLEYeDsWjHtFX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKXLspoqcHhWTvIEU7ALHtAd2S5hLFGC4HlyV7YibOPn2fWX96dXAnDeayuOK2UrUnIgEYDLoHC5sk4kW3xxzfpPWqgeyc3cfRTm2CD5VYluU73x0tDmB4jTUm5/dG6Lxr8iIz97Wn+btAIOBoJxCzEQff+8OSYchj6nY7XGk7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=zOMJcvIb; arc=none smtp.client-ip=57.103.68.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-3 (Postfix) with ESMTPS id 02024180012F;
	Wed, 11 Mar 2026 09:35:25 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1773221729; x=1775813729; bh=dNN9WWKwBKH3gQcNFlBkwyFrnLx/iogaHOI8uHszivs=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=zOMJcvIbnFO6KE5UaLdcEiR0AAXPMnDg158as7aKHt1QQ1bfcBGgT9oqF9VDBqp/DeeuctUPTsRvbEOj+KH/A1ShFUDX9VlPs/+5HAscwC22OgHfVh7ydhuYs2x9hiXHzmT9Aw2lF4j107wNZrfI8uLuYnIrbMtjLeIAys7knIkzjs/RsmJ46tYLgGZVckZiuGRj7LNhuAQ7FxJc2wKYPixIp+bY8M81gVk8oiIt03nxjI+3B9JD6OjAGfBBoaKsE33a5pV8afsDmMwbxSX2C9hGTzCL6avHvKfmic6CFecXEBeEF+oq7U8sYA8NvR8FbsImtiuPNSKAqf/dGTy7GQ==
mail-alias-created-date: 1772007648188
Received: from sdhn.cc (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-3 (Postfix) with ESMTPSA id 3C279180024D;
	Wed, 11 Mar 2026 09:35:23 +0000 (UTC)
Date: Wed, 11 Mar 2026 12:35:20 +0300
From: Mohamad Alsadhan <mo@sdhn.cc>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <v6fyrivdraa2rgqhe2jqwmow4tgqczk5e2pzlarmcwjxhai6e7@knw7nv7jtbgi>
References: <20260225102819.16553-1-mo@sdhn.cc>
 <20260227132713.23106-1-mo@sdhn.cc>
 <CANiq72krbKir91s-sVLt4v9k9qV8PQTLrH2uhMdByb882CXZ8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72krbKir91s-sVLt4v9k9qV8PQTLrH2uhMdByb882CXZ8w@mail.gmail.com>
X-Proofpoint-GUID: qcBmCIY_5OhCWruF1QNBWk28pm7DiPIk
X-Proofpoint-ORIG-GUID: qcBmCIY_5OhCWruF1QNBWk28pm7DiPIk
X-Authority-Info-Out: v=2.4 cv=N9sk1m9B c=1 sm=1 tr=0 ts=69b1375e
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=C2Lk0GTtW4qa2Tr3f00A:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MCBTYWx0ZWRfXy77wUJJEwaro
 muhQSRN6QO1sHha1/BrOe5VAk9Uo6F590Oh4+QfvjllalzldmjW4yk5s2iUzTBfxhqQ1eW5qOQO
 3soX4eIC2L0r6NS7ay6RL2noA0rTGBYOVsOHZ2DgTx9WbOzM1VH8EDFCA8Xg2HuOZ9/rF+XjfFK
 hFNKK+kOFZxwQcVqoW4bmgB0L0KQ12hIp5jqrvR7X5ANWx6vMG3ll1YPDZuO2HoZReSCYNT8dEW
 AIpH39HfgrV+0X1wEkmx5aJHEkluMcfGyKKgliFmVyoYHClrHfNCrw3UudOzP6+N1HUjj+IOulS
 1zbxONE59+56ldCvzPLEhcmVPaZopQ0prV4VWQQmLFLKupq9QTajmg1ZV/ptKo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=583
 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0 clxscore=1030 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603110080
X-JNJ: AAAAAAABbYC4Q4UmcYClzWh4DcAHSBSUGwdvPtuyUkLO4/5DGrR/1Zy1xJGshpyU1Zg3t9P2uzE3uYMDFG8UGdMGYciKA9rsGHprRc3qfwKsmGb2VELuNdM01Nmr/nH+e10mLKVrl5Jy4VZLqyqgyGvTXz7QsL1YZZq/EK++deY9Ox83u2BYSw8eK+CJ8/ZfEf+Qs1enTpxN/P6B6Mwd2B0ZmEfw39CTgimbc3fA8pKb+MXlIuVADERtoWKLthACVhOBaI73u8aOuxEGWtrPWEX815AIxnZT6iQu7h3KWqFRVGp5UFaqJ7ZqrmtnadFFtlno1l+Xf946WHC+G97hWrvq8YVKS2dLWVLHssSm/dUYPZ/HHdu2DKGuxnvW73t0190KQPjXTTEPLY99P1n53MAGmx6SDX4mRdwK+c0tYMHOW9TAxSlmFD+AZhJSQfigB2FWYTMz0xaulIUIMGO20ojGl3GblHu7xNJXvvjz+zP2ac8buHEU6gi92VKBKPAJM5aZRe7fjT+7Y2kp5JwINMToo+md340uJ/rxnRx5jiFE+153/KhiPe0NeW91VQZNIFMGaD9T80dzIsiaVTBFRBLev91dv5oxIW9imLOMMcVTPO0mQrXmX+qr5oM7Z4nv1n0uCXt+DWHgNmyubCjKrAmzSmhY4yWqN6IABfnoLmSQVYaPBjqr4PBR7p0F3YstyssyffdnYjUKS1d2XhHJZyBttY6/LzFeEt5DIdRqYg8TzA==
X-Rspamd-Queue-Id: 7826326151E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sdhn.cc:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11859-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sdhn.cc];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[sdhn.cc:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mo@sdhn.cc,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sdhn.cc:dkim]
X-Rspamd-Action: no action

On 26/03/11 06:56am, Miguel Ojeda wrote:
> Since v2 is fairly different than v1, I would probably have dropped this tag.
> 
Noted. My bad.

> It is good that this gives diagnostics, but do we want to make the
> logic so involved?
> 
> Did you try what Gary suggested (a wrapper script) and it didn't work?

I was trying to take Gary's comments about unexpected/surprising behaviour into
account without adding too much complexity (e.g. new script file and mangling 
commands as env vars) for such an edge case. 

Instead if the user wants to pass some complex command, they get a diagnostic 
to tell them what's going on and to pass their own script. I felt that was a 
decent compromise. 

However, If the logic is already too involved. Then might as well just go with 
the full proper fix. I can go ahead and do that in V3.

Cheers, 
Mo

