Return-Path: <linux-kbuild+bounces-325-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0F80CAA5
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 14:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3F2F1F21092
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 13:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18A43D971;
	Mon, 11 Dec 2023 13:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B5IWwCzC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71093C5
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Dec 2023 05:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702300689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rYJjOHMQNv8CehdRtIn2st/ORKqIu2WjVhZP47qrPZM=;
	b=B5IWwCzCLI/z7PKtB5CPL0qghsp10IRRoJN3rXlP83l1hvauhJvnhVfeVV8/Rr3VoAXcI/
	ltMAN3upzOUq/5xIV+a8mTAwKJc2gtPJOZ8UBL5hoLJB0XxgnaKOxSv/xnbzFk7QUbHD9l
	zerWFiVOyeZk6adNwtYDG8GAzhQMsog=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-vNnDd1T4OzOibbhZfRZOhQ-1; Mon, 11 Dec 2023 08:18:08 -0500
X-MC-Unique: vNnDd1T4OzOibbhZfRZOhQ-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4257662f905so60125731cf.0
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Dec 2023 05:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702300688; x=1702905488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYJjOHMQNv8CehdRtIn2st/ORKqIu2WjVhZP47qrPZM=;
        b=EjdK9fAY6R5HAK25DZnqgcz3I/C7z89md9vRu08V9sIaJtg4mtH+bcdvJsKGyiuIQJ
         J2E7QkFIZWkpjhIhvWCNtLEU7UOvS7+5awT/lSy7YOK8+76WWn+wg66tfFTxfLs+kWkg
         d3sNkeq6sWQfy3Wys8XioMWQKN9Jztm5EUc19piqGiQ8EDxVcAcBiveBs1+t/IEZdj8B
         mCBiz66mad6ywtIMRb7Om7DZWSumcheLTrTBsh6IICiZuJMw6AqhlxqEhj2pDaB85C7q
         MFiR1pV0YirHw/iiCFR96g9zbbE6KNZ90TZF16Mrin4Oxys6PiVHYnM8Ob5giKCxSYJz
         2twA==
X-Gm-Message-State: AOJu0YwLcHOuTRtr8tPF7dEG7gWakmFStJnpvFpZICieNNaxSjlMLW1h
	GcJuYQdgqC/+A+rrTJh3LK9vjE23gygmPsLI2e3lLjqTtIjpGwns6CxKVmekRsxIlA1Ofz2+bAK
	HGN/zZQRdYQyM8XDJiSUjncLCAVynOmoPStmUVhAs
X-Received: by 2002:a05:622a:1b8b:b0:423:93d7:8078 with SMTP id bp11-20020a05622a1b8b00b0042393d78078mr5500879qtb.47.1702300687850;
        Mon, 11 Dec 2023 05:18:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3ApjHCSg4Tz7TvRn1/DLyTdxYh5Enge845CTRnBH5FlZN4+JNJt84O+SXzZjBgTLf7Tjmc8GE/aFg4o9HOMQ=
X-Received: by 2002:a05:622a:1b8b:b0:423:93d7:8078 with SMTP id
 bp11-20020a05622a1b8b00b0042393d78078mr5500872qtb.47.1702300687639; Mon, 11
 Dec 2023 05:18:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208181802.88528-3-leobras@redhat.com> <CAK7LNAQk3Nm53qf95p7yQbSQ_M3phD_n5OMGxFWorGg_4fpQZg@mail.gmail.com>
 <ZXcLEKSBg9Bd1qEu@LeoBras>
In-Reply-To: <ZXcLEKSBg9Bd1qEu@LeoBras>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 11 Dec 2023 10:17:51 -0300
Message-ID: <CAJ6HWG5SfEC2=dzR8A5aGVeNFKwdsUa=BZm-iB4Rp4ZDKYAVMw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 1/1] scripts: Introduce a default git.orderFile
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 10:14=E2=80=AFAM <lsoaresp@redhat.com> wrote:
>
> From: Leonardo Bras <masahiroy@kernel.org>

Sorry about this, there seems to be a bug in my send-email script.
I will get it fixed.

[...]


