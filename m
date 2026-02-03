Return-Path: <linux-kbuild+bounces-10984-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFN4BomVgWl/HAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10984-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 07:28:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CD1D539E
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 07:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CEA9304C977
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 06:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33E93793B3;
	Tue,  3 Feb 2026 06:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIKwInRB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6161B3793A5
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Feb 2026 06:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099979; cv=pass; b=T1J/SELvlkeqZ7lS9P000shVnix15go+V1wHWjl/c73vDhnSi1XKy8REJVSkeK6B01dhl8P/nRKBD3nT/H1RZjujrfQ1R5e5vBXT4PYiEzWg5IUftMx2DI928QM/TrCzecVxGAOUosqXASeRwpfiiGsoY6XfheKm/thbCQOWmJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099979; c=relaxed/simple;
	bh=pMT8nHzjO13x7EK0SCi6VMzu6gcXMEGO5a57dcdwL08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AgEneXjkIq0QUtxf8N6GkE8K3G/nlLWlRFucflMkbVnRQ5k/TFxAzWYWuUS2rp3ySsB4wMpKHFEpeVglquW16EZrT850D1v20ujvogMIZgmKgv5c113KH9mmGT32FfgLoFC4nCQfVrELhsBVmGC8KbTwfgTTYmqEsiVIRRdvNOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIKwInRB; arc=pass smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c6af798a83so608541485a.0
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Feb 2026 22:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770099977; cv=none;
        d=google.com; s=arc-20240605;
        b=SeRZxoKNoxBJFaSV/5DQ0alBKJdpmr1ma04X09WBO9/ucASExG/xdyOVOe+QSooCLR
         //cdLu1bPuoJ71VONy9ipsFaL+ACWhUbMAI1ahgwmk3J8yW4ksWtaqjFW6FAAKMqUVC4
         qUIN03WKj1rdHMOKSe3s7DhGrB8p1B5NgTFVdMiItn6dmbRianINNBwBRnbZro8hyy2E
         XFO/MJbiXbDeb1RMpS1H7Gka/KEgh4bS/Um59uiT83XXgrU3gYegjKDgxFQBFmmw7C7M
         o+UVwl0CLQJaB00hBwdiFIwAmmrSSD8U9acZPRnmYYhsktVuBlvEo0SkN7JiTA319sUy
         iuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jQtdjc6SxCWdKixbRoBwE8AnY5BVOTEpwCEY4zoYinI=;
        fh=sGwwnksnE0AFru4Wg7HOJCF5zOqaNpgvZqV/h/HE6wg=;
        b=Vwe4ocaMJoRn09AYkMeaHGI0VA5wzo2JvO8NkSm9+KDnCIb/POZmL+ku4Jipk9SX3L
         NKsjZO/ud5jZm/Si40xuLA4sehS5z1JAS8PDuP8KLQLQq1Fu9pP8HSqHgUqDhadnRA6f
         zmxX2TAz9PFucGCRV1OcATd3XN1XHhW8IQ3T5YwSwsjsezbFMfY3bXTAAJdAKrr6BhTR
         +RmRgKAj+NgXzUQSWVXQvGAt33xfKZfYFfB1M6lc+GS10vKP0nj3yhPYEUM9WL7DbPTP
         qlcsgwewvC75TjdY/s1tLuNAi4ZKRqbvTqGZCICCQ/rSI/BkSz55sMHz7tAb1L5i04Ge
         WCfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770099977; x=1770704777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQtdjc6SxCWdKixbRoBwE8AnY5BVOTEpwCEY4zoYinI=;
        b=UIKwInRB3e8AFskyKKIZ2ffXCfcLQFkbS0PMnK6+tU/5DXRt6vImrpt+I7jhKS5Aiz
         lJpu5Dm3AHpRqOVBtUgP9Fk3dHeDCdnx8BFoe9ZUVw/NunByRutvDbzouckfjNSqVCB7
         /u3agyvB5E27qyE5KdBZqciaH6AbumOzvTGDQjlaxSmvw925mzgVf4cBo1DPg2CTLZD1
         F/gBAWH1iiJfQsckoI8Ah+cOpQQzEP0i6J7yDztwoyqu+nuH6qrcL3ynkG1msFyq4oPN
         tKiFCUb9gdHmL8txytlY79iWNz+jwB6SdlH28bSHvEVUkMKEUwK+kiPGiTvHIG9frxQn
         VVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770099977; x=1770704777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jQtdjc6SxCWdKixbRoBwE8AnY5BVOTEpwCEY4zoYinI=;
        b=TrQ5U53QJzOYQzdTYn5qVh/R3CA/++Bv62g+k92P8kZr/CVuTbgcgYNTpqfgZbaW4C
         3AySb83PmWugyXhZJI2YV9vsxz2jPfBIHkUVCDDpH0bG4/+4q975aqIwickE5/RmoL80
         fZQ3TSHPG0OesAF8JinNjK7P/dnBVSnqelJbCuloW/WoAzWBtIgeSRMpfU81sn8q66Mf
         IxyHVgAPalPZNcnykD3OjkLVxUck4soey77xHI3KxdJsZabv6MVViKnNNoczW/7SK5M1
         4liZZ7HaedMYPJg3v//G2W8R7cHZjLuUQyHzPjVsjAU7m9RU3Y33Alvv9D+CALb/rTHi
         2VHQ==
X-Gm-Message-State: AOJu0YyS7x5GPvxQYiTEqXFqgafaRMBAND2uV/80XwpLFK44MgTBz7xc
	XZkMRm4sy/6JzI8dnx84zLNMjw+b4PaeYYS+yKBl6CqmSa8KmTZL5IRSpaP4MwECJ/zBIq2dI6l
	9xstVIPKRQh3CbcpXuZWojtIKklAsbZenXStUyFt8Bg==
X-Gm-Gg: AZuq6aK+aofZdsRjssn9qDxqpp7KG0skirJf7CGi6hIMRRRA10aOMtKOQX5UNtix9dE
	NG3y2dqaAcYWry8pSwOdAvdlqMGyW5Nb+Qozi3PGzocT5A+8iEDMPzB7pV9eJi9uJ3BtJ2cbi1I
	7btW5LKmNnmWOe+nnGDsGPNBasH1T9bdIylqPJasU7ILANMZEZ7m9nDnBaf0h7vbLICaO6fNJk9
	ZK/9Y4zIFNNijkBGXLf49EW5alMdAcrG3l+IJVLKPzAMb4GjmvwYoTbDdfxr6ouXu20n6gZzsfk
	fL+RFSxqMjZOFeHU6w1/BcjTSI7W
X-Received: by 2002:a05:620a:2684:b0:8c6:b19a:5a46 with SMTP id
 af79cd13be357-8c9eb2dfa86mr1802924185a.47.1770099977063; Mon, 02 Feb 2026
 22:26:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202054541.17399-1-diego.viola@gmail.com> <177009452526.3190166.2162163285999095717.b4-ty@kernel.org>
In-Reply-To: <177009452526.3190166.2162163285999095717.b4-ty@kernel.org>
From: Diego Viola <diego.viola@gmail.com>
Date: Tue, 3 Feb 2026 03:26:06 -0300
X-Gm-Features: AZwV_QiOKe1NjCZKp7ZMBssEbOs9VSI3BnYX_UoVPujeAOPg7FN4YXxY6MZ8qjw
Message-ID: <CA+ToGPF+piYMB7Yfrcj6vi8rzs6_TwZLb-tPUwwG5t_ua6p6yQ@mail.gmail.com>
Subject: Re: [PATCH] streamline_config.pl: remove superfluous exclamation mark
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10984-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[diegoviola@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 75CD1D539E
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 1:55=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Mon, 02 Feb 2026 02:45:41 -0300, Diego Viola wrote:
> > In order to make the output cleaner and more consistent with other
> > scripts.
> >
> >
>
> Applied to
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild=
-next
>
> Thanks!
>
> [1/1] streamline_config.pl: remove superfluous exclamation mark
>       https://git.kernel.org/kbuild/c/72043cf7f100c
>
> Please look out for regression or issue reports or other follow up
> comments, as they may result in the patch/series getting dropped or
> reverted. Patches applied to an "unstable" branch are accepted pending
> wider testing in -next and any post-commit review; they will generally
> be moved to the main branch in a week if no issues are found.
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>

Thank you!

