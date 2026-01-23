Return-Path: <linux-kbuild+bounces-10840-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA1oElGRc2l0xAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10840-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 16:18:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C932A77B08
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 16:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F9BB300A310
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 15:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7558E14AD0D;
	Fri, 23 Jan 2026 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmKHz5AM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7202C0F6D
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181274; cv=pass; b=KznHWwuc+NnR4q/+WFMYU+YsQ9eLR2MvQ1jqAZ+E0YdukPiDYWSgkZgiignlkgYp+DpkelKGcaL4TpUGOpRuJX/fg/llFvkPQsLxj6luRlyHcp6bGOuHjxIMuIO8NlalH3UVYdohRlXb0DHWTrv8p3clZI8DyXbVa4bJc+QCkcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181274; c=relaxed/simple;
	bh=UmNZ1UeAvy64L1P2yecuyfu5N9v+2SBxb7XgEhkx0bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iiLmHIx64uVbe42clQj27Py7mgYE9TnbXENYkMLh09aNczoo5ajCsY9tlcgMXLIQcstJ9HaeyIWEK41FE62wgwogk+Sylzswgsmj0DdRR6FAlfZGrEMjVKcaWWZ9B868bua32tw/zrOh3lI8Bq7qOL/EoHLJ4sh8jup8swAOoFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmKHz5AM; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12339e20a87so196579c88.3
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 07:14:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769181269; cv=none;
        d=google.com; s=arc-20240605;
        b=d3NfG9PT3NLGzU/eqh2uAF/wfn+CbL0TPkfUM3kSlyU0Dati6W5FL3seibLnnhwBcR
         GBtaLWQVtmtloTegXo0DDCVAF1cel5+DBkZjqzlqcUGePB7xpNdVg4W6Qw77vZZcf0mi
         Zc79mqhm1W/LjLrO5FJXGuOT3V15xpHACTVUGZrQN41xExuJ4Ty246HsRo5ovIeK8YA0
         LSueoflPkyAg63pUEuMQojovNpCaAkY7LoOUEjexStqHWAc6n66LDxatSeqd6Ibf2yH+
         /TKuQV70Qgog0n9Orv/lP7IyS59jVxaRTaETdAjznjiVs2/neUTq7Oof3K2jERgFxgEG
         NQEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=neJOP8jN2V9lp5fdvMj3vkMf58D9j818uc0HAkXTy2g=;
        fh=L9zMnTbnvElz0DK27FaCqzjNIzvP5wgFxu+31W0Z6GM=;
        b=Aw3QjGmt6Ed4XOUfe6SocvbuF5k03G4m04e6ASDu2ddquoVclEBlSu+EVaQ1G+43Y9
         QWw3gevrB/HDrEMTYmB0iq0vBhI8CSLMCqWJ240E39cHidQOUlmPWH5R5PIdt+DGsC/5
         vMb7rciRfV3xV2nBuOKdrVhrbBv8NOLuhsF3KaqB/qG/9QdwV9Rv6/DOjBQvTsviVjFY
         KBORYmmKhZt9y9Q1jYNhdj8GyHzpGrOMejmh7vXwr33qM+ta2soOLmmeJrBWRWz+z2U9
         Z3rpyR5CkZHItdcCS/uPVdhZMq9y4UTKBHXS5SVCDrp+DjItVTyQaBHweflDYHqsJ4GT
         66Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769181269; x=1769786069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neJOP8jN2V9lp5fdvMj3vkMf58D9j818uc0HAkXTy2g=;
        b=bmKHz5AMpobjHXyRgMjAT9yT9afltdCEFDWp1t5YWpfaeMmWjDPGJxHXVqzpzFkl6z
         16iUQOyIi/R7tF7YDr5AAzH58Kny/10IBdRaNUOhOcjUom1F1xpUVO4sSQXcdoZV/q3I
         0qiwimvk7G5x5txmzC+uaYtXnYnyf1jtj/5iiYA/4cVAI/0XupYhSNXTX6ejmYFToZnQ
         rNDE6sh3vzyC+/6HnyHwsVE1nSzzW6T3yXhZ0e31vKLL9o+YPjZZdicPIqdBJKrlVNTL
         wWH9oAZxTGB++8525o7w1WXZj/O0XiCDQlW10fyZJt/sybdyoB7tCTI+Za1gbhge10+P
         JYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769181269; x=1769786069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=neJOP8jN2V9lp5fdvMj3vkMf58D9j818uc0HAkXTy2g=;
        b=fXIVQ0ScmUQC53EQbnRdvnPC+3vJEDybvEUdhBNk2BHQB8DJAvzr+ppFO6tP1siYIT
         Px1deeZIMk+JrrHvsmaf/uhOCIV5dRqgLb8v4rN1Lr4kAVPm1bT9Td3pk8T/EZ2cmUFl
         FOfeua1jVnFv/PoeJ2aTW5nlCQWfBB2mKmfPmUaFya0/nNFejmnTfDU3va1vAOxr5u41
         iRybZuX2pKNWDQUaa3wF7XvPmA5T6PDNckcgiv391gvW85mPK2bALoaJDZYK1pq2k1Ax
         VGruzDLI0FFfqw7RwVB0f3VvASbUAGPkmIJUe7M1sQTdwBjkHMNuivk5AAcFuycBGxAQ
         WpgA==
X-Forwarded-Encrypted: i=1; AJvYcCXf3AujaqH8qHt+mJ7t9gY92oLvhkFGoGoFIeDi+ySVixrMUored9jsU59bzzSCOZYvJePtkGmBVq3oLeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyehwEqMtIvP3cPPrAsd79UNnfeu6Dx691/Foah2epOXqfQM7k4
	Nn5mIAoSRaULyFcwqGt8GBmZbncfaKZstfX8gq/yTObpFJUFZWdB9MRSfkXXoXSvkhU3TVzerwP
	lT1tsqkx+XVPIHv8qESw2O8YlCt8Y9gc=
X-Gm-Gg: AZuq6aIgCwl5pevhAtjjNOnn22Ta5uAg87uSmTjhnr+0Eg/NV02ALRd8tRzHMjRHAeP
	xddKk+B0ynbykl2qRcStlncmv6FFtkFD3nQXuAJUnVpwcBdUteUF3l0idTwNRs292l7PZuUHvnr
	yu/9Z7NcMXNKWtS6AjubWvhbdZas+2tapQr3bhaNsorQ4rJBcWCM7juYKnHBEmb7vWERcGLGh94
	c+sHgS7xTDcBpetHtNHS8LBSIxXigxJkxmcUpP61JepsBcXgkzBT95iQh1DKyzef5sjis2k4xiO
	H5Ys8CVNtSPVq2cGfTV0ZWEzDN1dN7lBjoaPdL56C0ZEtpq4pZzUY0lxAaQ0dn7jE1eymzgDzsm
	lUlRchBLc6bvF
X-Received: by 2002:a05:7301:1697:b0:2b7:24fc:f639 with SMTP id
 5a478bee46e88-2b73999817amr817854eec.3.1769181268858; Fri, 23 Jan 2026
 07:14:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
In-Reply-To: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Jan 2026 16:14:16 +0100
X-Gm-Features: AZwV_QhVZq85hhIXlTgFFo5EaIgDHLirHi5KCy0zfpyfhZCpCXdOecre-lqn1Os
Message-ID: <CANiq72mLBdW+XEB-BTgjngwRxgVTRzc1K6XiwBVRkSFu+108yw@mail.gmail.com>
Subject: Re: [PATCH 0/3] scripts/container: Minor fixups suggested by ruff
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Guillaume Tucker <gtucker@gtucker.io>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10840-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C932A77B08
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 12:27=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> This series fixes a few warnings that I see when running
>
>   $ ruff check --select C4,RUF scripts/container
>
> which were the few warnings from my personal ruff.toml that seemed most
> interesting.

I haven't had time to look into the new container support yet, but
having kernel Python scripts Ruff-clean sounds good in general, and I
wonder -- should we consider having a `.ruff.toml` eventually?

At least we have a small `.pylintrc` already, which is quite recent by the =
way.

I think I recall you also using Black and/or Flake8, for
ClangBuiltLinux-related bits perhaps?

Thanks!

Cheers,
Miguel

