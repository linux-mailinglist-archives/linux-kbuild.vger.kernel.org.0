Return-Path: <linux-kbuild+bounces-11975-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJSXLxpJuGlTbgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11975-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 19:16:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0D29EE5F
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 19:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41E233015868
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 18:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13F03D7D82;
	Mon, 16 Mar 2026 18:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="njIyFF07"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865103D75D4
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 18:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773685014; cv=pass; b=jvIKBhIFOr+ghlnD/wwQzdjnpklL0+E99oTV78GDw1yjPxc8pxBi9cB8gS54yOEnVVMFgGe0sgZW7Yp06Bb2mkS1rSq+d6dPoi9nJCdAwWNXx+LQWrheCjsikfOp8EX7bM6P/xM0lk/mDV7L3RjzlCucz3gkKYdQw5ZRBPs4pz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773685014; c=relaxed/simple;
	bh=FY4llxFucY58v3yOI/ISkoJCLoAr7NBi35OuhGaZt2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kIe/1atqH0Pca4AyPc+ZkOvrZVwkV2XxZJoFmMynLmflHYefTc58nUgL6YwLPGbNvhU9/E3RI82578fiepQSfNAAX+/tfGBohuGTsjtNW+Wk1RA6mB2saBAX0FVnBpO9zYZZ48ym0iJOdVy11o2574y2gWscJ1qecxEvL9Zz79I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=njIyFF07; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50906a98ffeso83401cf.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 11:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773685012; cv=none;
        d=google.com; s=arc-20240605;
        b=dJGmoobuuEBomHVVzIjUGD80AbKmKQC98tna4/UGZeIDKAUn7bdIWDXlYp1PiwFhii
         6GDeIjpHT8YBE1Swzca7xH0550xRX7KHt1hO1BfixXQYg14UNjvG72q0ayfTD8Z6r2Zz
         QfCY0mPX+A4DTW82zWhQ7clwWlTWaM2Bq5N4SiCR2IO27L/ZfjyDaRfiQQq+mAg6i4DS
         fStuNZcyq1Ntv/1EzYuLBbkiHj0Khq2akxGtLWbiddcBRJ9ys/mBAf+/FNTEONuOOSGD
         aIU2lUfmhaO3pGUnIZsGQNJYSy/JQeGxyHLBKRJSFubQrvQEyR8wmzpRXeHE3NNVg0bV
         D/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FY4llxFucY58v3yOI/ISkoJCLoAr7NBi35OuhGaZt2E=;
        fh=AHHKe9yqf9mkviQSpXKeJkMzbW+8Y9YvXu+R2wJuu+M=;
        b=a0EI+Vq81L039nGtVqFkfQfda0Kz/hcttCcNlkEe4WL0JAuiOYnVzQXVjfUlpEhV0z
         SMNq0DbOfO2NKheGkuNNY6S6mJqIH8s5XXBsw5xowaZy/Iue8P5bFwFRTmoQCMK+xfxW
         gR5zKaMAlFe/vWVleISnxv67wYJ6KAWxGihcSEAbevmPA6IMttX/684ll8iRUvnhRKLY
         SyUnUsfojMR21lsr6uFySBUQA0TzXbX9/1qiPupIiL2xnyrHmSQjiQ1+oOGW7ifAUKzu
         RjMRphweqPAaYHK6DeJo72EwA9bOeqU4QvkjFc8Ui3COkbDyMfNH7RkFc4gNQ/H2AYkc
         3Z9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773685012; x=1774289812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FY4llxFucY58v3yOI/ISkoJCLoAr7NBi35OuhGaZt2E=;
        b=njIyFF07eWMlz0Zyv1QoIonkomGGes5WO/f7qxXMBOf4/XeGlgD+fVImVWAqCt85tm
         OqX5Ol35JP4NBVf1/ptyIHLUo3/iUVQvnb6E7H3qvklUxhy2SdgBHO09y11VZhG8m65d
         0YfEHFON1v+hqplw6ZOfaV51g2AqFQa71bQPnK+lYybQl7Gjhb9V1UtVlERZy1YaCvnf
         Nk3DdmMpAAq3X/OcEfWmRDjstwFHKHgCd0skaFAkcMnxAkrGQGIbOjavpB+ejKChBPET
         I+OL5W+XK2C7RsjErdaAqBmfcPzejlylqAuJG4t4pE1W6iszLI6UeZQk2zESChBaKZ+6
         bDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773685012; x=1774289812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FY4llxFucY58v3yOI/ISkoJCLoAr7NBi35OuhGaZt2E=;
        b=ED5qGcCy+B0ArrjEskrnWFsUm/aGCXI16+rOX6fDsidxJ/BsfCypfCQQaW8Ecc1HtH
         HlX7SDzX41uP6fDS0tjMdo26eAgOI9HFnNGF4OJaR4GI1OofmSQ79tR/Hpqd9GBQyZy8
         SMyjmJCzwFT0URQe1aj6teG+Hr2aG50xBKuR3d0OOUEJG0sZcDmCfgITMXWO/MrrT2wQ
         NRGkCzxXQo8rCIQb1++OyTRNr9hg+qIaH/A9xH/64DmDAJeRRbGGlLv3S06yVD4YYt6x
         njKxyxllYLX7c2avLb2TKE2hn2LP0qa7MuC5KYzaJ+kEOH5x/LZNwokOwcjFkkQsZXqq
         Xd8w==
X-Forwarded-Encrypted: i=1; AJvYcCXBLFKUZJ7Z2Hq8VJ85oW6VvUUvqILkZl2E/RJ3Ut3vH95LEaXpQrqZ184yY7H1+ZlM/7TxTo9huJQItfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YymM/bKo4cYProJhihcCOBzbJhDuH7W+M+rFVADw/87NfBtqe/v
	fqHAMsOf4lUCoVhSCz8Xti3dSBKSXP/96yrbIrV0Qtl9dQ4jkczTgFYy0RUxtBtNZMeyn5C7N/p
	ZtFNC8jbZr7NjND5sw/IR0jUA3/LiugGo5q7FOgWS
X-Gm-Gg: ATEYQzx++myVYTNlH/RKfbQ1h0ISUvBkP7Hgzbi5ZsJO91nPpUN2cGp2nMAYxKriKOc
	hVJwtsx/uRTrePHPLxHODP0/MPXtDVfTF8+2Lon/YsKxvm2L6E+qruBOlH8OqlL1qAViQWaONBE
	Oy9JpzLIZ+CfpZ2Ya6c+gZZgDb17yqlRNFtuGe4IBOJMWsOc2ykuWk8zTwPf3OBkB/OMmvrSNES
	J6HT4HEXZdpTcxW4p3mqq/aS3nkEd9nIF3RnlfK/tZBFSWcPURKq+4pMQcv0VOTHFJyjo5QqWAS
	UB7StfjfDk+8KPcrMvQLaCyACY2VneOcfcqbsw==
X-Received: by 2002:ac8:574d:0:b0:509:21ff:cd49 with SMTP id
 d75a77b69052e-50998c16f4dmr1517421cf.4.1773685012044; Mon, 16 Mar 2026
 11:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com> <20251028182822.3210436-2-xur@google.com>
 <abgGnfO5ZrpOUza7@levanger> <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
 <CAF1bQ=RarMBKd2KhBje9de-ymjPf+tKUVpgPxspJPm0yTao2Mw@mail.gmail.com> <20260316175953.GA1910339@ax162>
In-Reply-To: <20260316175953.GA1910339@ax162>
From: Rong Xu <xur@google.com>
Date: Mon, 16 Mar 2026 11:16:41 -0700
X-Gm-Features: AaiRm5319l1Xo1I4EcZirAQ-qwKYh0OZwcLVufvbNKAfptzH7a9DlgHGnFfBuR8
Message-ID: <CAF1bQ=TqFwmm9NhBPnxaoTCqHOsm1Q6MLhNcqpYq4uObZxzk3A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nicolas Schier <nsc@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11975-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,vger.kernel.org,lists.linux.dev,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 58A0D29EE5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If that's the case, we can just remove flag "--thin". Can we verify if
that works?

-Rong

On Mon, Mar 16, 2026 at 11:00=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Mon, Mar 16, 2026 at 05:27:01PM +0000, Rong Xu wrote:
> > I think the problem was $(AR) mPi and llvm-ar <=3D 14 do work correctly
> > in preserving the orders for "thin" archives without --thin.
> >
> > We can either
> > (1) Bump the LLVM version to 15 and remove the --thin flag, or
>
> The minimum supported version of LLVM for building the kernel was
> bumped to 15 in 6.18 with commit 20c098928356 ("kbuild: Bump minimum
> version of LLVM for building the kernel to 15.0.0"), so it seems like we
> can just do this?
>
> Cheers,
> Nathan

