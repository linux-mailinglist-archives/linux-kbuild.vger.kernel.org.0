Return-Path: <linux-kbuild+bounces-11316-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Fdc8Kqv7kGnaeAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11316-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 23:48:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC56C13DBBE
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 23:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 676C6301A91F
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 22:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C77274B59;
	Sat, 14 Feb 2026 22:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ap1zvP/c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E92081AA8
	for <linux-kbuild@vger.kernel.org>; Sat, 14 Feb 2026 22:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771109287; cv=none; b=Z8Fm9ilkhbfIZ+EBb6tfTq0hQU53tHU6sqvW2AKn3DSLdD3u0H3p5ER7k7XhI64mMtWmRAP+6Ie+P4bU7aiZGU/W4iCW1J5bD/mnU+w62NLlPKd8UFEgRFW1MavWUT5ED1kGPQ2NKZu9MoblVZSqh8gx45d5jJOxx3vtpee5P+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771109287; c=relaxed/simple;
	bh=LbE5Z72PD3MPJ43Bce1pDWGIiyWmIGts/W+3nAK+cjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2jpRua79tj0OAQRst40k/kmJGy3S4WLPBRIbIi5nv3kzAm8lLiqo9Mp0xpcfV/myJ0uXtRwJSyxEjHwJV0l8dIqZC08Q/oT5Ry2tryVJdvixVY0NNfqchDbwuo4dxdjn5A9hiuGOiKCnBXWCCnbmj1FTTnP9PH44mUOawRkWFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ap1zvP/c; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65940221f7eso3512190a12.0
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Feb 2026 14:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771109284; x=1771714084; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mYkdhtRoL4GjkDCyjPYy3UUZTydOkdf7syWKV5f5AgY=;
        b=ap1zvP/co68pfYmG+93DgHX4MimyvyH5mdFE4b0VoWKuhRCnbyn2gkjyazIleQKXE9
         IACJ9A25sGHHn80gc+VwbQPWGTaupw3W83rjJtv+qxnCW6e6UL8SChwpb8IqcyLSeviT
         IPjk42byPpDGm1/ZdfrOT0nJoHjMs7f3E5ue8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771109284; x=1771714084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYkdhtRoL4GjkDCyjPYy3UUZTydOkdf7syWKV5f5AgY=;
        b=suD7TxLJXcNk4rbfd5Oc0QAevLNdZjPN8kvbKeAL18Vhh/73r3KgEZyvL85jpP7qmy
         0QEPCfayTjjPm6yBnSL5nB9BrYrdneO9zdGk4y1LD+cJTJTAVo6Zt4RfY6oUHAveVXCo
         83pic1zximlN1sp7v4rH7FXnMVN+LaXF9gmmDvaNzPAeisY+sOOqkk1jGC4SmEW4vnyW
         NZ9uOYTFAW6eaM4Sa0iN3Xh3VXEgDeG0mUrgNy4ryFkHnYAEBxU6y/AvtbUd11RJhkcQ
         kGdYJuuoQtCHW3VDHXKA9yzfvS2MyUIzIJersNMpjpvXgkLVlOP+RqfAQCoL+gibQ1Ba
         ImKA==
X-Forwarded-Encrypted: i=1; AJvYcCVjGlqwaLX/Z2ydsKb6LDxrvITekSKPSpZzPxApuf5xt08XuY0hqDlxTZNEB8i9mGJG1hAky1B+r8y6YNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzYsUId5+dNZOg4hyjfS9l/CSN5poklTPA1lYwPgifi3MZa1/i
	123PASzmdU62+wDvOkYR7DvfGLNAvLLA4915jOCXDqoXhuZXOMe+ceVVeYNl6kUmiy5Ac80kstk
	jvCX4BdI=
X-Gm-Gg: AZuq6aI6skzwpYWGWJKF8LrbY0gHDOa13vTY2RC8TeKu6jLNgPy2nNldYqVWxXzfw8K
	ZIsMV7TjJN0VizkJZt+zuJkn92/dnir7a0UyXdLPK0jxKMKjUkWD0fRiHKlZ9SJx8ObXQs3uVJM
	TtDb1F8pPs4pprOWvKgXXQGAaYxMZXLHf1zkfjnUY28CPDwD3MDLRP5khbiGeuk6/cQqHbfmhtu
	5Mq7LXOExSPCcBf29w9xHwUfWQpaQ0FbPMRfaaLyfjEOmWFD8NsYrhO2LK7akVZZ2LOKMYcTU3W
	T5QZ+SUxdKHJV7T0jUoQPOqdXagN0j/5U4vmPgfohjwH6OHUAB4iXJ3t2kZK8p3Atne+PRLrP+S
	H8VuyfujzC7aq4sGVSy1XTNxw8OV72Lu1DajUU6bP0R0y5t9p8fKziJ3QagZ/kjJ9PwwGKhhvdG
	7esisyodlCj/C0Bu2KjiUe2EwGdMM6DqvMfUJK6nsHaYTmB7eOvirujbQgQ+49gLMrNpxT+5+9
X-Received: by 2002:a17:907:9409:b0:b87:3174:9bbe with SMTP id a640c23a62f3a-b8facf9849bmr399569866b.61.1771109284144;
        Sat, 14 Feb 2026 14:48:04 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e579sm110440166b.9.2026.02.14.14.48.03
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Feb 2026 14:48:03 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65be78011c8so151026a12.3
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Feb 2026 14:48:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwUUQYLOmVVdbq4HP1g0YMztZwLxFEPJtFXKXcjDoUPCJpLDkcUYr7q2dYMucszQCEjU7I4FEhXLhA6Qc=@vger.kernel.org
X-Received: by 2002:a17:906:7303:b0:b8f:6f75:f9e with SMTP id
 a640c23a62f3a-b8facca23a8mr343042466b.1.1771109283474; Sat, 14 Feb 2026
 14:48:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aZBlTsIwTzS0tqBD@carbonx1> <177110244909.2897141.11184148040863874004.pr-tracker-bot@kernel.org>
 <aZDpCUcIXLmuydoF@carbonx1>
In-Reply-To: <aZDpCUcIXLmuydoF@carbonx1>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Feb 2026 14:47:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj03hLzK2D=+OYmjgcmGM+XYymp8GyaEs=C0=rXG2nb7w@mail.gmail.com>
X-Gm-Features: AaiRm50HHjVAcxBlyn1res84hJ74BQRuPE9I7BE6WlfzWIM12HlM8cBqswuaZQA
Message-ID: <CAHk-=wj03hLzK2D=+OYmjgcmGM+XYymp8GyaEs=C0=rXG2nb7w@mail.gmail.com>
Subject: Re: [GIT PULL] fbdev fixes and updates for v7.0-rc1
To: Helge Deller <deller@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11316-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-foundation.org:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EC56C13DBBE
X-Rspamd-Action: no action

[ Adding Kconfig maintainers and linux-kbuild list ]

On Sat, 14 Feb 2026 at 13:30, Helge Deller <deller@kernel.org> wrote:
>
> Linus, I'm really sorry, but I messed up drivers/gpu/drm/Kconfig while
> trying to fix a merge conflict.
> My patch series should not have touched drivers/gpu/drm/Kconfig at all.
> That's purely my fault and not the fault of the patch author.

Humm. Funky how the Kconfig parts never complained about the
duplication of all those source lines, so the problem was basically
entirely hidden and things still "worked" even though that Kconfig
file had been so messed up.

I'm not sure if the Kconfig tools could perhaps warn about this kind
of duplication - we might have some of it intentionally - but it does
make me go "Hmm".

Nathan, Nicolas, comments? See that commit ca4ee40bf13d for the
partial revert, and notice how Kconfig is entirely happy both before
and after that..

                Linus

