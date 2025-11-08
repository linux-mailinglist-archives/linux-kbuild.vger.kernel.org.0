Return-Path: <linux-kbuild+bounces-9454-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B3099C42652
	for <lists+linux-kbuild@lfdr.de>; Sat, 08 Nov 2025 05:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 825214E16FD
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Nov 2025 04:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D01283FDC;
	Sat,  8 Nov 2025 04:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXzxSyHL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F3F23535E
	for <linux-kbuild@vger.kernel.org>; Sat,  8 Nov 2025 04:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762574661; cv=none; b=ea6lnpShDDCRwbgkeZ/aIjYudseo7gy8/W/3reXA/TuNgwaWOGbS3IPxCQZkL3Wgh3xbvTTLWggWMMCB/bqkf8fcqiq4PnzR2iRS2PYYJRaQ4uzCf+6rkRA6ny022a485WwFgHbAWTV7JlN3WMpOhOpJs/R/cQL5PeH3XHZhmyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762574661; c=relaxed/simple;
	bh=cO1PJs5Hqxhy/M98m+zUxMJMnTWtXWiqkqLvzKCdndE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cg9BQGafRvvuaGQaH4OZIwEIeZA1q6qPOWpftz/IG89P7vwR4p7zO2T4O6o8tTiRAXxfQ/8Jwq/pPrCRf4O79ewhW80eXldEHoq8HdjQPR885hBPw0hqbm2cNi3bNuSQAP1l2fEJLzMnLc/rK1McAYEFFw1n2D8TYEXBZfYH0e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXzxSyHL; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7a9fb70f7a9so194905b3a.1
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Nov 2025 20:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762574659; x=1763179459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cO1PJs5Hqxhy/M98m+zUxMJMnTWtXWiqkqLvzKCdndE=;
        b=lXzxSyHLUJLzTzvCPJmM82Q/+729AEO76oVuSgh7ygZBJy5peupyoFqxolD6BcmRhh
         I5mAxmVLMXdMoNZCTP8KFhJRr0oRGm2P10EaWuHJrLPgc1/vhsCOpT+wJFAkGh9JtDx8
         XiXRRakkkvXcTqhVDNUCRZK0p4PLAf0KUAdg/rPTU/UWL9Fas3OOwhJDHZy/SCLrJY73
         uPpr6kqS2LPXEMSyejI0pV9XfO23ufIPZD45QJSzYpiAz/SzhgU7vZUwVmZFiO1WlSEJ
         +Y1fgeIWDee1phqhpSsFNlx7Gid4yPqaEiIh1zSD6M9qw1VQ5v2K0z3NAiFpYbUDs626
         yeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762574659; x=1763179459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cO1PJs5Hqxhy/M98m+zUxMJMnTWtXWiqkqLvzKCdndE=;
        b=KfxlLFpKCm9V6CZmfTq8CL1uwS1QPJQd25aMjf4RgkNH83a84q1C0pRDBllPFu9u5L
         5bWq0QFmi4E2akfK1yprvIZV8PMIDo7Dy/jCxYlaGHvvpEC8x/h/uApnpiEBbKf9T/DT
         j4T4a92aVc/OLdgDyKkUUWP6ViE4I+gcochqXPIcwepVUGH3dCldUma3HsmOB0yyh11a
         r0G43sS+VlAnX2z9vLy73/K2cuFAcW4gS3ZyRnbGz1k71/I8EJgRP+N0H1n6HvGW53pK
         OvIWRawTuwBfFA40Mf1MUjnJDAXcBUUyVX/KfR1mzjCcjlVbNR2g9/hENhP24y0q8HYZ
         qgmw==
X-Forwarded-Encrypted: i=1; AJvYcCUac47YkHLTQzgZqx+SPbKA4oGwyUxnhu/oAYPMDfxjIZzGWTzXKT8qw0NAyNRy+0LgUoL5E7OOQV7m8K0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbN/j/ydY18gJj70D1E0WVMaYdnSwO6kXIY3AJcbsze5mO3fKr
	pO3myyAIM7JRZ+/0EISJBmAbLTx/hr+hgA6eVPS8NXJyXtEoM7O0ZPupaBZJ6Aw/zM/5QXupGI0
	CRMhKlr/7HzQeqHKdubaL8L57D2N0Uqc=
X-Gm-Gg: ASbGncvK7ofRKsyYFGGrxUmlo1vp6fIQurY/ogCN3r8w+RqpDjI32U+9c5H7bH0/Vra
	J41VBKCA07ZPb3mk7LNIJRm4xM659wGWEqW3Aj6qfvHkBeAnRW30uGoJxG95k1N8p+Y89eAhxWu
	kyqasMtDuzjFdKdU2qMSmQJ0JrKfnHBNpvUmWVvDLU/DekHEBydQfZ4z8HdNVVn/oNWeBC51kqi
	FFYUYbZaJVGRlIwVS/Dz/29hhf8iRPoIwaNuhCE++hS6T3QsIAJ0VVjIaJgjufUuv1tkjCO9fuI
	o62Y2VR75RpgXv/eS7ock8CHux4Vjigrp6PP0M+FTYDeeZOvHs8JaJ/TkvTHR8L3fklddh5mrMQ
	3N94=
X-Google-Smtp-Source: AGHT+IHtsf35gyHQQ+P8KqDNivFkhr5pO5E4GRAujTawzDWGcDwzDptdRMlZayKqSlaa1m/AhQ+SjfvPJ/4wS4YO3Xw=
X-Received: by 2002:a17:902:f0c4:b0:25a:4437:dbb7 with SMTP id
 d9443c01a7336-297e5649721mr6082085ad.4.1762574659105; Fri, 07 Nov 2025
 20:04:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
 <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
 <CANiq72=OFO8fBpJ6xvGunYrx5hXfcjQJ=YDqFxtMPWDzfzwpKw@mail.gmail.com>
 <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com> <CANiq72ncHgjjJ_c2fdTgOO9LxmmotRS8S6pwyckLmPJG_4GPNg@mail.gmail.com>
In-Reply-To: <CANiq72ncHgjjJ_c2fdTgOO9LxmmotRS8S6pwyckLmPJG_4GPNg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Nov 2025 05:04:06 +0100
X-Gm-Features: AWmQ_bn6skCdJtWEfzrc7-WSBc4N1Ycv25g4TWlNvHlubVb6S7pwG8zKBllg60w
Message-ID: <CANiq72kcRsTWPhQVJ18P6RUxL=+c1Z8BJkyK_kRR8EBmmH+cWg@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 4:51=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> What do you mean?

Do you mean in some cases? i.e. like with `CLIPPY=3D1`?

Cheers,
Miguel

