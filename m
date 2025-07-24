Return-Path: <linux-kbuild+bounces-8137-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D140B10F56
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 18:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ADEDAE0F21
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 16:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87C624061F;
	Thu, 24 Jul 2025 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nwh1h535"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F0A1DF247;
	Thu, 24 Jul 2025 16:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753372837; cv=none; b=TV0ZcCJcDJYbeB/uL87UiDzLlD3ZpO1y49Zk0lqdBqJ0/O3trScBAdrkfc1fWjhc5yMkrNg5C5D4NZtUswqvxtfIdwWCpNuVUchgIkjhxWMCbF0fjoRdJZEOclM6dfdLZOZboZROiXn4zwlSqFdesPfkiklNgJB7hcjj2lLeREU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753372837; c=relaxed/simple;
	bh=FbPmgwrQmhELpPPQh/rwyTALm9IvfeHwHW8BTVv/FLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uju1IYFtd7KKjYSVZ8Ov87nfA5MBJiyoMrNjwZLhyxkPrrcz9k/a80AhnWURU+/PVj/NiU16p7H/3vNxpqwcWahrtLFnlVNa8ZTxD/BpItAWv+P8reN6OWiowZe8Egpx74BCBpMcogClGwVzyDOJgCIHd9y3GLS9fHKVjjjFzMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nwh1h535; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b3510c22173so134130a12.0;
        Thu, 24 Jul 2025 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753372835; x=1753977635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbPmgwrQmhELpPPQh/rwyTALm9IvfeHwHW8BTVv/FLQ=;
        b=Nwh1h535QPw3DdEuQNdIkiUcXE97ZecNErN9SP7dqyG5Uj8NxI+S/4gjpl7zTTN1t2
         SLEWK4qBAS547nnu1kJAPdzeEUaWgfxKbQTTEAaQPPCqVoracC8juXICSTd+d2cXVd6R
         OE/mD0mDu8YjI7a6QSAA8sCQC4F2RrW6EZtfNHtuL5tJmVuhgw5QIR+Ss8jLtztnRGTc
         GiDTw0yVlxl9obdp4BW1HdbgyrtbO5hloUto941sfTFwdDnyjhPhjTGNUpIK5rxt5dHJ
         tbd8eMjNJyp3yoKOW6ZPp2J/N5RBL9eG8YefeOW0SsM+xWEUMsaRghBXEAop3Ix6ZLFR
         vMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753372836; x=1753977636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbPmgwrQmhELpPPQh/rwyTALm9IvfeHwHW8BTVv/FLQ=;
        b=K6WSlxYAKA0lk8Zy/sHD8tv9LSOl0IdIDJXAbcK/0EHb+mEj+NIBvMqQB1J6oMB1/5
         XWhEc72I0+nxdu4801bwY7CzF/G29suG81avDjGFNncOy7D4TgPiRiFWvq25Z0qlrxiG
         YBXL5gggL0+3t+Li+jAEGnIhd8t5k9asEoYBrrVMPGeaNe2Ji26sDUU7Ft7dTh/PkkF+
         cHTRQ4OXCbKq1JAahFO1zzD7Xq3u3PR4OiJCQA+FzV3IOsYiM0MygFuLl/tCXZ/KRBUV
         SQao19JCAf7/Lx8JgOxK7jSyQY3Zqtq1wSXMRWxAQDcPTrXsRmKX1OJJB7PvM4hVlslj
         ti7g==
X-Forwarded-Encrypted: i=1; AJvYcCVCyYxHtt0zSK45fhtn4yGg2WroA6eK3fMPCH7ajhD7T6g8L9cYJQ4aL95Q5tTV6xOVdJt69TqKhR9MY71a2Q==@vger.kernel.org, AJvYcCVDgPTVuhLffa37cqg0X60zfeavPKLbiTFwUByMRpg3bqnexB0dbCpc7yUcQUqBrKhw5R0CYgWsFjIy4ZY=@vger.kernel.org, AJvYcCW1/WuJPFudFgffNRLbJh57Bhnh1HdxT/TynkC74ukVmIVL2bwn43PSnsekzvLziYFf/8gciZFytmUDZ57qFPM=@vger.kernel.org, AJvYcCXbsJPWF0Zk32ko03lRGZfBgK4+xjF3EwwpqoxuEQxMJlrMavH6fxPDgaXO6bFndB0UA/NgvZTmesJOZJkw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzygaw+Zmw5umUIKtbsavoacMjXSUPYmkiSoM7kLt/ZyblMjA2r
	sk7mHu10BjN9/KGtT3IZIJ7Tr4sA3h+1LwJjD4/gQuEn2SbXT3al87oUcpKTuEADF11q5VqmIoR
	oCk+NzL4A8he5j5DZOOAk2zeXfI/djCQ=
X-Gm-Gg: ASbGnctoS43YjGXmlFecVYRhH/zViXqTOLCj37QsXUXFnVRaoEWOLhcaQbOk6QbY42e
	56BFGXNrecq1GmQJBPLT1h6p0XAj1vqCCq4th0CT4TEo7vdZTO6WinUAxdzy4tWKPQ5AL4uw/9Z
	kk3Xxj5nosz1m1OU8yyfqvuNmRZ6s+aIufW2G332khAb2b893hKq/Mdw3AbsRPJBqEISb2tjF2A
	BODfOrH
X-Google-Smtp-Source: AGHT+IEixyq95CchIezC/JloLVj0RsN+UyKsKMSCQC6gQRgajTHmeGZRSoEE5SqrPIOpBBTfzaC+/mr6yDfJmFLpCIY=
X-Received: by 2002:a17:902:cec6:b0:23d:eb95:da15 with SMTP id
 d9443c01a7336-23f9814bd03mr36628715ad.6.1753372835358; Thu, 24 Jul 2025
 09:00:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1753354215.git.legion@kernel.org> <e78d20afcc059cec3cd977ee74a0ec4df06de05b.1753354215.git.legion@kernel.org>
In-Reply-To: <e78d20afcc059cec3cd977ee74a0ec4df06de05b.1753354215.git.legion@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 24 Jul 2025 18:00:22 +0200
X-Gm-Features: Ac12FXzX-zdf43RhmmLozngcxIqMNsHW59ozas8iLUbpVV_D5V8Act7CA_O0LmM
Message-ID: <CANiq72krLSP=xe9tMj5sPaBDmEK09x2J_CsbY5cU0wNAj_ffRw@mail.gmail.com>
Subject: Re: [PATCH v5 07/10] modpost: Add modname to mod_device_table alias
To: Alexey Gladkov <legion@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 3:50=E2=80=AFPM Alexey Gladkov <legion@kernel.org> =
wrote:
>
> At this point, if a symbol is compiled as part of the kernel,
> information about which module the symbol belongs to is lost.
>
> To save this it is possible to add the module name to the alias name.
> It's not very pretty, but it's possible for now.
>
> Cc: Miguel Ojeda <ojeda@kernel.org>

Thanks for the ping -- Cc'ing as well Andreas who is working on module
bits lately (but is away right now) and Danilo who maintains the
modified file:

Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>

Cheers,
Miguel

