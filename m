Return-Path: <linux-kbuild+bounces-11817-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC1sJyQEsWmFpwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11817-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 06:56:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 405AF25C9C1
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 06:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5AD430244DF
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 05:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D0A345757;
	Wed, 11 Mar 2026 05:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRRn/fur"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F1634752B
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2026 05:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773208608; cv=pass; b=f8PaKmcUp7d6G9Pa7x2bQJiGf7JMe2sIPmGrHS7s26xa6c29T04ooXlZdaw9fhC68bxBdd1pwslszbtNKmKsLF8/uJZ0S8Thwr+0WcVh4I+Ts3ZzPlge5jlpxHkWX3caFuMjxH/3FHNuasb9bSTVrcDJ2YN3GXFEU2tXPAZsxBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773208608; c=relaxed/simple;
	bh=IfAF5ftZwI5PNKitbUmyPKz3OSE/YAHHlOqkWEEgBRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUMavGGzNFgWDnn8rezt60/JVht+otcVDOdheoczUzKdVjj5PnU6aUf4PQ3S9BaIqpLfryge5jo/9/Htwr/gnnQE81DarVLvB2C6WE+FO8x/hS2W3R7GmAtQWWVA71zPJH6QQOB0hFFouCwmsJa1unC6ZEMLGT9mif9B0oLxlLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRRn/fur; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2be2425ad18so474342eec.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 22:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773208606; cv=none;
        d=google.com; s=arc-20240605;
        b=Gt5j/wlmXfwLU7oXn+2VZ7CHaBIIeSWMCJsfoB7u8wTY5AhRCZ5G9vB64asa1Hw5oP
         e+JmQQ1hu6R3/Dy6iwGXTzDlLEH/Y+ihoJpcMj+fWmfj45JxpWIAAfaBIHPxplz6Pd12
         q20vMk6xmobDxh40d48dw6CbS8ScWlgI4BBdJtDeal+Gu1Bn4YCP+4XPMO4twbFvPzoV
         1YFydbTMBPBDQS/ZBIZ20zb3Ypc+rc1MD7fAfWMTd/+F/VGjD8g5KII4UrCOR/sa0xwG
         4Jqaj2wBENqdoGtoYfJkl/WfsxY1/V1N7SNoXcbbFD/oiZoayJU14weKC1vPlNNamqCd
         n/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IfAF5ftZwI5PNKitbUmyPKz3OSE/YAHHlOqkWEEgBRs=;
        fh=SRoyVerdlEcSv+nw0hPWq+KSM/NDCyLX5yA9FHH8P9Y=;
        b=cxcdPaaAXX1s/7PULNntmZTQV5fxqyx3l2o84C/MbLAtWk9bbZcoL47u0xZTYEXnss
         Tdo5ZaumuFDdy1xdSb2EKFr0LpoET35OqFcLn/qwQHV1WBhts0HHcML6S/r20SHaeQVf
         b0bX0E2ex8klSpD653A3uae511Wd6rBNE95km3Ix/mmZt9vgqcVWFp+Zru/SVuw12FaT
         FggAp44q6pr1E1hoTCHl008Efpf/eTjgN9chRDImJ7sYW+0o/6ZxgJYfvnmdcVF/P3ba
         62tM9OC7nTn8eB39kNyfYvvanBKgHdLxgnPTR3A4j7G5R6IvDkeKXhwa6xad1kw1ZuzO
         JBzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773208606; x=1773813406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfAF5ftZwI5PNKitbUmyPKz3OSE/YAHHlOqkWEEgBRs=;
        b=jRRn/furqfT0Hb/2s9/5TcMXwGpdrXMTq8uShYbNl0TbEWeVPKGJ+73M9H46uDD8AS
         ESjz1jIEej6k+1bDI+l0bcaCa9W5QEEK2a0Lx+TyogHcTj54iwAcinG483pcVavDcBEN
         T1DSZpQ/PBAPEAVx+0bKrWd5WnI40rg8EqfMfPJwabVmCBsNy59ek6bbt2Ld+pyq60e4
         axn1AxAyyiFT6kkT4RCu6FaveOBTjpkCLM8+9VfmGibzrC4ZXWHwV9hqorafkmOklPmR
         /epS1xgvoKIOfV4tCxTWxvclK+Sd4OynJOc7JHmBHWc0XDERj30yUUVoFr4blQWJIASz
         zolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773208606; x=1773813406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IfAF5ftZwI5PNKitbUmyPKz3OSE/YAHHlOqkWEEgBRs=;
        b=kar/IMCaXLP72PlJc48xjHzN9SRlQQmEgt1yWK/A12Nk3Y4BvK0GQDSYpcb7yfbmdK
         ubT5lE/L6EIP+gnyM2vxiJNGbYnfmnEXMrc3YCtNS8eEDk4q8af9sDHtx0IYlSUro6XZ
         6aZdMD5N93jpEzqcrin+VHX80biBYyxDsh5Y2sn5kWxGhP90hij/u3N4sXcMrpEY8DSj
         CwtdgYUNL+Qa9QY/IHeiJv4LPFcQDYHyMXyqTv2j22sOOaqtOY7t8ipMxwT/SQuQ9S86
         zeYpU8jndyd7B+5gX7xcdQXjJuSFpAW8imRqtoZB7yOIrMQhOzD/j1CtGIdw6ORiaw9K
         Uuag==
X-Forwarded-Encrypted: i=1; AJvYcCWVqXX5hRYoDiwSyYPy3ahg5ppgSG1aOpGBzN5EUxJ9t1vmDr4I5dipsOEVF5X2Q+nk5qZCDdZov1s5Cl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVD/81lpQYqVliWZPoOOmMEXvM4FjiJI2niW8ifn2LUQBMjapt
	UXIEqzZuTTNPMM58fXe7q/H9iJH+zpVqJbdyp6mu7T7zo4A8ViLmpZTQnSTE3L1+LLljQVbIvjq
	vOwxmuEOLvHZ6I0jgDiOs+fDB2E1hKVYOcitPzexN5w==
X-Gm-Gg: ATEYQzwmiG5l7DzNw8StNHzjzpfZ9LNUifB+nSXTTkboV7454OOr/A1rtjpwk4P0iP2
	kCt/A1lNO+MLvKv0I2bMqgJNcX9va4WWvTD/ITZGH+Cu33uGXcQe7qMLZM77H+QjmLKo65BhQo9
	QpK3z6yEN29lyYpPqsWhVhj28SMn9ymZ21bvcyg1w1KgxCNn5RowV4AaTTd/LdwIBRbAu149P+V
	rodwfEPEp7S37HEzBGULo8pbc2JlPURxkT7rGO/u9/QAtQZYSv0CkIdV1yOIrNpmncdKV7aMq7E
	XXythLXbw8LGdKyY2VSbQxhfCV2YAiriBw8C+DraPsIunqqr+W4qz1VyFz9iqJ0y153tnlway1+
	SQDbug7kCYtp/DK66jjigqDs=
X-Received: by 2002:a05:7301:688a:b0:2be:1f56:ed0d with SMTP id
 5a478bee46e88-2be8a56adfcmr283199eec.6.1773208606293; Tue, 10 Mar 2026
 22:56:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225102819.16553-1-mo@sdhn.cc> <20260227132713.23106-1-mo@sdhn.cc>
In-Reply-To: <20260227132713.23106-1-mo@sdhn.cc>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Mar 2026 06:56:34 +0100
X-Gm-Features: AaiRm50nK5auv5AgoYCnff3sOr39v0ZCLalsa928K5d6pnGRtrjHnMIXMdLmuSc
Message-ID: <CANiq72krbKir91s-sVLt4v9k9qV8PQTLrH2uhMdByb882CXZ8w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: host: use single executable for rustc -C linker
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 405AF25C9C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-11817-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 2:27=E2=80=AFPM Mohamad Alsadhan <mo@sdhn.cc> wrote=
:
>
> Acked-by: Nathan Chancellor <nathan@kernel.org>

Since v2 is fairly different than v1, I would probably have dropped this ta=
g.

> +ifneq ($(words $(HOSTRUSTC_LD)),1)
> +ifneq ($(filter command\ line environment,$(origin HOSTRUSTC_LD)),)
> +$(error HOSTRUSTC_LD must be a single executable for rustc -C linker=3D.=
 Got: "$(HOSTRUSTC_LD)")
> +endif
> +HOSTRUSTC_LD :=3D $(lastword $(HOSTCC))
> +$(warning HOSTCC expands to multiple arguments. Trying HOSTRUSTC_LD=3D"$=
(HOSTRUSTC_LD)" for rustc. Set HOSTRUSTC_LD to override.)
> +endif

It is good that this gives diagnostics, but do we want to make the
logic so involved?

Did you try what Gary suggested (a wrapper script) and it didn't work?

Thanks!

Cheers,
Miguel

