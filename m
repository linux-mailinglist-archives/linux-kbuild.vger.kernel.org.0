Return-Path: <linux-kbuild+bounces-10853-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fsqxIG0KdGkQ1wAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10853-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 00:55:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3D37B8F4
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 00:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFF9930131D9
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 23:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF082773C1;
	Fri, 23 Jan 2026 23:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIh3E+RQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3687226CF1
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 23:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769212521; cv=pass; b=PQJ2sz2naydI2TD2Soij0LYYrz6CAJO2SA3W4ajEb/RKqWa9+sQrpXakIl/jbQF9RvlfP1rNC2ssiCzM31mL/5Gpeh9Yd/ySIIK6/s+01wHhCCzhqhznPF1HMJWuzhrgdtD3TwBGnkYj7FTRv/OIA6qBKnDd2ahZndvpKLhXi1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769212521; c=relaxed/simple;
	bh=G1hJyNqBKTlqE160VTaXP905X780Kha5YR88GVUxats=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lW2VvdCLmvAQF7vwS6FCtj5CDq5S4qj63OZluTwhXfcIggo1p86Xb9PBCXfbZaHdHawz2LUCQRf4d5Rn4xXuhsDGo3ANXyPmJYM0fQ1bKy7DONYMibB7gYp2hQ0He91B5yhDIPMLdmaz5m29WeLJYOTglzZgrXAD7e3qRWYXL3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIh3E+RQ; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b1769fda0eso320247eec.3
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 15:55:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769212519; cv=none;
        d=google.com; s=arc-20240605;
        b=k+ugu2WM6rPlGTNGGdmBklcQd9dMl5a/fVfhz/6t4jnMV+xX/yuF63AQOwMgAwKBTi
         +KWhPhsQFm3KCBIT9utu3TdBaKlG5HA+J9Fh67OBZ/VhYPDlEYSBY0Gnl/iLCoNWuTNp
         Z7l0hZChAde2n8J5iUh1H9SWcvNY0qSgH+PCxVeJtbCVwCHRSmmTlfVjy5sGKCuyrDBT
         iHqp5ncAEpCmbvqDxEW20RlpeTJe8zDNh/Q05L8WJtD8VP0VnTeU45nOjXqvMP0+Dhff
         tt1VdDz+LYNSLqMvUJ6aLsvSgssoHI+fG6X7J4P6Eh6i21n8A1hbhXppmP2AC/vT+EmV
         2ZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XgeTnh8BChdXVIY364ptEaVPgUTXrttFR7pu79Dn1h8=;
        fh=5GhE9Qj30JvxfGHmM4/Mj9HxyYuOR15SePJDAwXTQpM=;
        b=fJ5aY2tRC3ihWK50FVthYEWkUagsFXVN4M9ir7QYsaH+aGzvk8kIUxhm8fF6ObaqSw
         A8TkSQ6tnrdQbnH2bJVrtIbeNmGIIIO3zHo5df0M6w/rVjSq1xBmqnf41ap/6Hm7jjW0
         oj2dlJmjPHze5gTslySRn2sz9MeorM//rStRkadJuoCg8IG5GSPkIhHgjTmLCWbecTr0
         jqMIl8qK0Pj5fjXcHteJhFXEzejIRfeD9ZiQFSaZONfR9kAQ9keBh+wq6WVbDV2dewS6
         uv777czjU8tPTV1sPVGGMiSUCsA8NFMMt/us5Ke6bhOFXM9GvVG9zr4YUWIAzcO7gXMQ
         TTng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769212519; x=1769817319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgeTnh8BChdXVIY364ptEaVPgUTXrttFR7pu79Dn1h8=;
        b=YIh3E+RQa55Nz6j3Rx99AmjZr9B0BvxwpulV94sr0/a9UGf4+3ROEiTNr7RXNu64n0
         o40k8dOO3EIDg5Gk/VbtFxQWA4Mz3Jrg0bJyOFAtul1n8DTq8L/btgzgY6PUnbi4z+x6
         2IjWZdrF+61ZbuvDwyv3WSRYDtxQgIl7MlmEju1UprmSHqY5E/s6t7wVe4Y17Qkbg7uX
         dFvG7WaWc5Uyecqdf5osTFjoh7DjKERng/GaekttucfDcmtEsMIQiu++vqEAVL5tBB9S
         ujlPVcjN3O1ZC/M1yTNqzRq6ws3NwSrnpTbS8Fcw0EeEYCs/3Rowje+ewfGHSWMMi92B
         H2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769212519; x=1769817319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XgeTnh8BChdXVIY364ptEaVPgUTXrttFR7pu79Dn1h8=;
        b=jWyqeea6VM9jHrZcpF6GW2v/3d4PtQt55nuj2GDNQ60HWzV+j/gJuUzz7pesGCzrFv
         13VxDWZR2eUT94LFpkzx7r/rVgfLCEDaOwvGqmsh5lhho7UxCD/Fwn5ci7J3Y7rVbRyQ
         maDIoaBxKmcIOXFngVuWtuUj6o9884FtZ//9rlrXw/Yl67IEVw3EZaQQCeh1JBg4ZlOz
         gS/gtc7zi2ypma8YWAb3CMtYj4gUbOIcUwCHRwRkktHlI+8+nn/pMWDRiqIFcY/Zx1hn
         XemJE3O0Ow3Ud0E2D6OA/DUD356xFHFEZtIAPAzl1AU89GNqO0EJmsFa1zTIZ80ziyBC
         NZRw==
X-Forwarded-Encrypted: i=1; AJvYcCV59weOFYjibWg2uBb2UBR4C8cZTVbkTXBdI55PVbrMCyin+7JWkpNQoXJWgT/cNS6OPR2Z1Alv1uj4N7A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhz9Y3/6Q5nU59ou7O7wiE3LSg1cwsScKRDxq7kSHrI4YBoZKS
	Xasu0qNARv3aY9CodwUKVfkMTb/QJQEiDwg0VeWul6MpxhSxiMGEcgHGvs8F1/8tQSetJyskYwr
	Ome3nN7yB0koE7ZvFoAQrxkl+FAPBFaRL6Q==
X-Gm-Gg: AZuq6aJnj9f2PtSamGskKGFGRYVVmoSM3171oTzf6dIIpjuzboMCfrCqAqqbvp4Bq3E
	ZPHx/JeA9Z+rftC3K63o5Xhq60lZFuBnPJZfWEivueYJSa6RU6gO0f5vOa1yKVY2i6nu1CqduxA
	FbbQ41stCukH+PuROREjlJF8ekGRl73fu6YAWilzxRpsb66L0P6rkYi8lli6FVC+IgdXIZQPtjk
	EFCjJHStoP8VQCMKiIH68O4m8ygCki/R92zq6btp3KWD7XhKpQW6x6pfFyeLMF2laoMa7gfWU2G
	ANz3Vsgq/pXEQpKMJCheXyTI7w4l7Jh45EPNzMKw7DnT77k/cx8SeNYIJFu91xVfQWKgWve5qDr
	/UoGMEqeECv/rXIaleBd+fNE=
X-Received: by 2002:a05:7300:c99:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b74e8d0951mr332199eec.4.1769212519044; Fri, 23 Jan 2026
 15:55:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
 <CANiq72mLBdW+XEB-BTgjngwRxgVTRzc1K6XiwBVRkSFu+108yw@mail.gmail.com> <20260123210128.GB95167@ax162>
In-Reply-To: <20260123210128.GB95167@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Jan 2026 00:55:06 +0100
X-Gm-Features: AZwV_Qgd6IPcTamR1oSdpdY0BdnmQZirTj3x8CQdd3XX3PgxOy-dN4DNNmOUJzk
Message-ID: <CANiq72kM1WkzUyXcWrzs7hHywWWvvdtjqA6CEPTi7KhxKj8weg@mail.gmail.com>
Subject: Re: [PATCH 0/3] scripts/container: Minor fixups suggested by ruff
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Guillaume Tucker <gtucker@gtucker.io>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10853-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: CB3D37B8F4
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 10:01=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> I think that we should. Even something as simple as the one in the Ruff
> docs would keep things consistent:
>
>   https://docs.astral.sh/ruff/linter/#rule-selection
>
> I guess the one problem there is consistency amongst developers (since
> one's linting workflow is fairly personal) and having a wide range of
> Python code across the tree but having a .ruff.toml for people to run if
> they want it is harmless.

Yeah, I think as long as it is optional (and the rules reasonable --
not sure how opinionated the defaults are, but we can tweak things as
needed), then it is a win with little downside.

It is similar to the clang-format situation -- some developers take
advantage of it, others don't.

Over time, the idea would be to try to define the set of rules that
most people is happy with, and thus to get more and more files to
conform.

Thanks!

Cheers,
Miguel

