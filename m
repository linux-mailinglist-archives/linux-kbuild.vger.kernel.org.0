Return-Path: <linux-kbuild+bounces-2829-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A33FC948A97
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 09:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C8411F20F2F
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 07:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5DA165F00;
	Tue,  6 Aug 2024 07:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+bT4YPZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E84A15C133
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 07:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722930646; cv=none; b=OdnVJHtbGJ0nIFBbz3ZmtRnvgsL5rpboXcgxJsBwomD6JKOHcQk0aOQQX6boJA3ud1k9iUOiAqvYLQrXAkE4hEckEZf/K8L5hs3yJ9R4oIBBOsKwzOKdbQcIvmkZbbR25Qou/OQjb4vpJNBOJEc6PpB5yAlQR0DhEBfxstceVWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722930646; c=relaxed/simple;
	bh=ZgHjBv8vHztwisdk7kt2iJ/CVy60USjX4NenCMbb6qI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/GvgdoeRd37t3KbpU/h2J4//gIZMb+gaJ1EBBL4iQbKV05i/8eor7bkO3Tu1G4M0bURx67Ikl4f27dkjdImPJYNcicyGdB/nOWmX2XZdaOLTo4O4KRXIihbUl14Fy4vWLwHnlhMrC8yvbcCoQ2Oolug00IdUtSj9JlYplHXxAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+bT4YPZ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7a92098ec97so371417a12.2
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2024 00:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722930644; x=1723535444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cntMslhvtGk749jsP6JApvNFT5xNjx/G+Udxc7uNi04=;
        b=E+bT4YPZk0zbVajQHBuTaYRLR0oWO79dG1V0yALxsqcnzuY9Ic2c9u4TxpoJ253ot8
         LK+IzJzwu7tR16dfG8MFhVCtxRy2ZLIn4oTnFTX539VOdMSP4ZWlUzrWSOPCf7HOS854
         eMc1WZvQ6qPgXDfCOsyPp13ldoRKVA/Y9I2UWWmfBK5V00nnCa7dUHD8pNCJTvdAOhfN
         70H/tECFETS0KJj6Ij/isLtk9Q1ME6vIBVZDpnYeq+dYSsc5pduBOU1IYQCAVpPmMogd
         oST5H2vxRp6GiPHO0Fmn8pfyVpiZQNU2LXPhTlqDPaHfWU/oDmn3WVJ7afMprMYfJSep
         2gLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722930644; x=1723535444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cntMslhvtGk749jsP6JApvNFT5xNjx/G+Udxc7uNi04=;
        b=F6H4hnoeVCPupgOQmhCvULaKoNVZ15hG+6ofkyP/e5IA+xamKIJwczB0PvS6+qf22+
         ECEKaC0JlnoHTKot6aBizdxkZziglYlfVimV8FbRZdPu9vzN5Qd/NAdMJIIKCHaOGnqs
         I/xY5XVbeFigkXdRc0wOgrE5gz+YdlZyxmk5OSB1RqrrhfJTIznkdzZJlHC6/OgsK7b4
         IC5qtKe/lo5dXIgKTJH87Od+2aWSoBdsL+n2ls7ti8oMPGKZ2zuQE9SMFo7oFjpUOaSo
         H/bKUP8P2FFntWDP4pdj85dvSxYH1/G60DGwueEmL64o1Ki8EHx/XLyJfNXbnkqjuJ+y
         dtPw==
X-Gm-Message-State: AOJu0YyreNk7NtaEo8u9LZ2F316cDRm1Hq1fxsII5O/5F8Yy5wpymh6C
	OYIS7ULvAmLxHu715CiWnKLurEt0u8AxF7eL3vJEl1r53Fiw1Jgjk4J/vITshjTRT0C9yaqr/ZC
	xbg4jMvrOmIAhmwFZtf7OSAbAnLY=
X-Google-Smtp-Source: AGHT+IEvqvbZYNSCm5II6Wpgy7jD/ydZ14dQScDY0oWYmQVgsIqIf7MyVgbiHs0nQGVhQ2iDQWC7Qdt6+kU+osSn5HM=
X-Received: by 2002:a05:6a20:7fa0:b0:1c2:5fa8:2de2 with SMTP id
 adf61e73a8af0-1c69953bad2mr16324038637.10.1722930644331; Tue, 06 Aug 2024
 00:50:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530210342.1540045-1-maximilian@mbosch.me>
In-Reply-To: <20240530210342.1540045-1-maximilian@mbosch.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Aug 2024 09:50:32 +0200
Message-ID: <CANiq72=+RiRvPBN=UW1DKT8DgLjUt8OJsOX1t2LsZAZtou2Dmw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: allow setting zstd compression level for modules
To: Maximilian Bosch <maximilian@mbosch.me>
Cc: linux-kbuild@vger.kernel.org, "torvic9@mailbox.org" <torvic9@mailbox.org>, 
	Piotr Gorski <lucjan.lucjanov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 11:17=E2=80=AFPM Maximilian Bosch <maximilian@mbosc=
h.me> wrote:
>
> From: "torvic9@mailbox.org" <torvic9@mailbox.org>
>
> Zstd offers a very fine-grained control of compression ratios.
> Add a Kconfig option that allows setting the desired compression
> level for module compression.
>
> Signed-off-by: Tor Vic <torvic9@mailbox.org>
> Tested-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
> Tested-by: Maximilian Bosch <maximilian@mbosch.me>

Missing Signed-off-by?

> +config MODULE_COMPRESS_ZSTD_LEVEL
> +       int "Compression level (1-19)"
> +       depends on MODULE_COMPRESS_ZSTD
> +       range 1 19
> +       default 3

Zstd supports levels up to 22, as well as "negative" ones (`--fast`),
right? I imagine there is a reason for the 1-19 range, but it would be
nice to mention the rationale.

Thanks!

Cheers,
Miguel

