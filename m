Return-Path: <linux-kbuild+bounces-11324-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L2kLGQllGnXAAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11324-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Feb 2026 09:23:00 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C1149E66
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Feb 2026 09:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 953303005A84
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Feb 2026 08:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC942DB7BD;
	Tue, 17 Feb 2026 08:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iETzEx0F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8312367D5
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Feb 2026 08:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771316578; cv=none; b=nKVETa4Rn5PSA0J1Iq5J0N1uoQa5rx2fwiuo3tkM5RGjwNKvoLF8nroznJDvbF8zsgk9m5aDNf4K68PfbVIWVqGANDMaTl41nkkQYEBuAKN0yJmg2gwsc645KWEXHQguURXFt+5hmm/vfqBNeAmdFy5JGNAaDM2AWpcM/lNMWJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771316578; c=relaxed/simple;
	bh=j9YvxgBnTjVJotxsZaz59b64frSQ5OWTlyiLqZ4fyTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLK1jeAYcJqAMcaA9gMLAvgB6DWaUQq7h32fu48GcJ3IYA6lMuzaF3E4a1NHxxmc1MYcGzIhuOnJZGusRWs2Os5LgVzN98C0oIbLUWgo+HMDDsGW17kmdsg05IxntoCyGt0ZdziTRG1VIXkudBLOvLKP0osiKzwOmTBBCmEHVXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iETzEx0F; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b884d5c787bso523352866b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Feb 2026 00:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771316576; x=1771921376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j9YvxgBnTjVJotxsZaz59b64frSQ5OWTlyiLqZ4fyTQ=;
        b=iETzEx0FcOsuVVzz8mVK1eDqkUxZyB5ytUJQuyQkplTJGVpUvyiLbQax0p9Tsbz7I5
         tywFAq2G2Jd9jaRPBvV+ipvpOkJxput82HpEV8dL0W2I6i+Z5SirXDHvhktQaWx6UYGW
         vVtTLqU9BmYTFlBGgRHcZyJXpTJ59Ei3M/CinQLa5ZU1X9vDpIgk6TLMOPxOac+abEAP
         5TECHq8jV/lCTGvxok3M5HesgJjLA7qqJHGInD5CQYz9pQY9OA+LQdQsSlQurioN59i9
         QH/LDeViMKabCHiy3p41867iBoVlX0zzicaSnDi7nc6YDp5902yggszVMR1hYUNPiBhN
         M1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771316576; x=1771921376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9YvxgBnTjVJotxsZaz59b64frSQ5OWTlyiLqZ4fyTQ=;
        b=blkVdZlDizAhnXXV8EaU8Z7V8m8DBd6nF0M86nT9WwnsYauyslYJ36g6/yz9k5gBVg
         SdrrVOnsX3V+9yuoIqW6mnSpxDDYtjRgdPo41cH2aLhhHM8093sHybYSjEmMLHcNJ/4R
         Wxxv2WNDpaStr/bjHs1L2ACpijd5u5cQMT5OFkn6Bv86XNXE/M0AO/3C3+ED4Az6D88K
         Y2gXkxaUFoGBUdMwPf5VLISjzZIg/MAn8+NFq4m5MI+dTsENZiP9Jllvkku+la6h2GnQ
         5iucLKIi9Oa6phWBtQihsVAjWk4q/MvZVZFDiZ34j04eusD8xZBs4DWqYWx+HJvRsTRf
         THag==
X-Forwarded-Encrypted: i=1; AJvYcCVtZhabr71gFROehu7NB2c+gmz8C+mSKFwRx0R4MmpDkbjnToLhTmrtMpMFEl+f3cwa6mRq8Fl1jhnbcnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK+jDY60exCyh7W/K543SyW7UwcamrJaEVbB+rXMT2qDUB9RWA
	GXS6y+7NKMlBhPzEgVai2lVnm8WREkBZCYfOhK2AbrTIwt3mSmyakLIY
X-Gm-Gg: AZuq6aLf1IjUfLL62JM0w3noF/yYVyR051qSX2c088TXErJRei+OftSZPdB9mi/XRS+
	4j8P+JsyOW4JibpdJ/tMiwRc+r4bLhF+wM1gaePGT62cM+x788JQAHX/DEYSIr49XCp70tBR8zB
	Z111QWpQX8shmkCfg0GThm2DdZQsiDpLryoNW3DwwznP0vgaxbYCIv0veFfY6TJmS/UIc2TukCZ
	N7+vWRsq54ohOZPeLHteyIhR14vWTMH2q3BE/B82zb56OS1CpZMLldqo7X48MSJWvuSbC20iybS
	VqGBFjsWsBYiaoluPgzq3oFjKLCtno78i/io5+F4hDV5O862+767RHm22QktnU+YK5xKV53krx1
	1RmDyAroeBRtGpTHSvLXWK3+WHQGgt7Zkuc2OHWe04h8h3p3AKEUH4eDJacWwU/elh0E8dYbjMB
	bk7KBnbWan0IKlHJlS1RlL3jhg95co57z5HoPN+6+Hphyu9AETu1Gxz6RF/RuZy09XSSoVDh06n
	qgH/W1b9lYSKSQUOPnsSE9KF9RAetJXlkXX
X-Received: by 2002:a17:907:7fa4:b0:b88:241e:693c with SMTP id a640c23a62f3a-b8fc3c7fa23mr672213466b.31.1771316575433;
        Tue, 17 Feb 2026 00:22:55 -0800 (PST)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb (dslb-002-207-075-089.002.207.pools.vodafone-ip.de. [2.207.75.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7385d80sm325883366b.16.2026.02.17.00.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 00:22:54 -0800 (PST)
Date: Tue, 17 Feb 2026 09:22:52 +0100
From: Dmitry Dolgov <9erthalion6@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH v1] tools build: Fix rust cross compilation
Message-ID: <nebqi6txwrsgztbsx5g7npptbsoyocbn6r2ebmzmwtigt2z27w@nh2xbmk3bp2e>
References: <20260213191212.33328-1-9erthalion6@gmail.com>
 <CANiq72n3FPOBVbR83-Vp6uetu8RnazMuu6MhzG_hA=_j18_BTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72n3FPOBVbR83-Vp6uetu8RnazMuu6MhzG_hA=_j18_BTA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11324-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[9erthalion6@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 599C1149E66
X-Rspamd-Action: no action

> On Mon, Feb 16, 2026 at 09:41:34PM +0100, Miguel Ojeda wrote:
> I think this was meant to v2.

Yep, I forgot to change the version (it was a bad idea to send it out
Friday evenig).

> By the way, should this have a Fixes: tag? i.e. since it sounds like
> this fixes an issue. Perhaps to 6a32fa5ccd33 ("tools build: Add a
> feature test for rust compiler"), or something else? I also usually
> recommend showing the error message in the commit message.

Right, I can add an example what happens.

> (Also, you can use "Link: ... [1]" for the link.)

Got it, thanks!

