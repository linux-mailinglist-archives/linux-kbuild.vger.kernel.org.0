Return-Path: <linux-kbuild+bounces-1691-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A18B3466
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Apr 2024 11:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47E4B1C21BBA
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Apr 2024 09:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8191913F425;
	Fri, 26 Apr 2024 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlanQF+P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1077713F01A
	for <linux-kbuild@vger.kernel.org>; Fri, 26 Apr 2024 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714124769; cv=none; b=WWuWqWMWs3ZH4Ioh6Cnn5dKHAqxGmZqq/qftu97FkUDUIMWfsh0U69FLRq00AnT9w2pVjb8N8lbUCUyf1dhEwRd+CkKQjD/3JMWN4FbeCQezf+cvY0FWCVlfmbe6kAcbROBI5yw4l9CQwDfJBxvrNyJ5Wsg7UGTjaZZfGbGbRrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714124769; c=relaxed/simple;
	bh=Y9amuU/mXjsQxV9RF0hIczZx9VCXFSLJGot6B9q+oeY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=oWrLFO/Of4HGh7FhKLc8mIqgR3jdGv7FbQ2B+UFgwp3JVizdTFT735eICfL3RJhyhEUA4oT2ivb9a86qJ1+pcgdoW5Z69NnFNglhSpDQOLgZfo9Y1OilrI57Gv5sU5lcrEk61jaeOeAK8Dh+hQvj6uKnNHUJys5OJoCaTn5xuyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlanQF+P; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-7e128b1ba75so569173241.3
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Apr 2024 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714124767; x=1714729567; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V6LeqH91PFAa74xEjMwabhV4g7/cv3k2BOY620IbETI=;
        b=dlanQF+P6wwkoXttcDZG/Hc0S6+MNWGpVLLcdsX9tobLJh6Htm180cAOaAcUflra8F
         dL8Is7GZlDnsZuskTJfFXLECGCWrD14OuigkEyzWAiLHK1JQvBySHfo9JNgZEYc8He/2
         Zt0A7NgY9sPwh5ZGvdaIjlUui5rdof/6l+474SJ3U/SPnopQAm4N7P61fJTuzIW2edPf
         Mz+jd3qgrlNC09b13lN17aexVmDucQkXtPGF4XFVu4ALtkPZEZ0tEhjHCSqj8IS34RVR
         HyCCoRHOtY1ZMb/Aa3n6246OAPywhblGAWLM8fa8K6sJ+UXQAZDlEdotKUduMIYYrqS1
         9U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714124767; x=1714729567;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6LeqH91PFAa74xEjMwabhV4g7/cv3k2BOY620IbETI=;
        b=E2mxF07WdxbZdBejlz1xHA1q5HrrQx8Pc3wD05HZjmj3MUB1eiHyNO0wydpbJ7KH+c
         yLBhP7ywGj7DSI2+AVe3kVfL8CBPh5neogf9LZu0ucvxfZhUkDmmbF6VWUar3LNV/0bl
         IZAvUIhvYyXYJPqe4ZCcxpYd+qq1mMy/ZvL07Uut2+h52MJnsdCpH8xqSp55pnSIdbIc
         GANJiZyIjkmfPRXhas/ChJ1cgrW9PxYfC9R7IJ2xKuWsjDTbCri19PIhnRGtIeC/S3cF
         ruhTRNGyYgJvMaIQtn7q5FfvAdk8Brx81jvnewrfrdztX3hoG1j4CJDE6GPSBELrhfxm
         5BcA==
X-Gm-Message-State: AOJu0YwGUl3fkUCzdUbDVh5vCO576FHHOiTut1c1UgeZSoyq8mpkOBRm
	fz3ju/UQ1AvG7Ov4sN0Ynk4ibRuBMrWpYCk2RtbjdWu29mMK6o9WJEdajSMnLsVNgjUepWODTkq
	Zo2fyk9tscuBd8gz21M/vX0gIIRSLciqHvCk=
X-Google-Smtp-Source: AGHT+IFqdJEtiEGpgLNLjCeee8XAE6UbrWMpW+hVjITRwJ0/6yjw5P1kplpqI/F4k36hfgarDXN7ozV6BU4xfX5HuCA=
X-Received: by 2002:a05:6122:2a0f:b0:4d3:1ef2:c97d with SMTP id
 fw15-20020a0561222a0f00b004d31ef2c97dmr1983520vkb.2.1714124766427; Fri, 26
 Apr 2024 02:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: qwer trump <vivazsj@gmail.com>
Date: Fri, 26 Apr 2024 17:45:55 +0800
Message-ID: <CANcniXsneeNs+Hfr9PScU2aYPyvn6re=5T0Cu5dgAa4N_b7m4A@mail.gmail.com>
Subject: Problem with rust module
To: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, all

I try to compile a  sample rust module with below Makefile:

obj-m += rust_minimal.o
all:
    make -C ../.. M=$(PWD) modules

but failed with below message:

ERROR: modpost: too long symbol
"_RNvNtNtCschHAZg3Q02y_6kernel5print14format_strings4INFO"
[/linux-rust/samples/rust/rust_minimal.ko]

But I see there are many long symbols in Module.symvers. So I guess there's
something wrong with modpost.

The relevant code is as follows:
   list_for_each_entry(s, &mod->unresolved_symbols, list) {
          if (!s->module)
              continue;
          if (!s->crc_valid) {
              warn("\"%s\" [%s.ko] has no CRC!\n",
                  s->name, mod->name);
              continue;
          }
          if (strlen(s->name) >= MODULE_NAME_LEN) {
              error("too long symbol \"%s\" [%s.ko]\n",
                    s->name, mod->name);
              break;
          }

 MODULE_NAME_LEN is weird. Is the code right?

Thanks.

