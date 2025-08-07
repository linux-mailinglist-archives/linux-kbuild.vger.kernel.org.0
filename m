Return-Path: <linux-kbuild+bounces-8309-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D87B0B1D1A4
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 06:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84D8E7264C0
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 04:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0261199FB0;
	Thu,  7 Aug 2025 04:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOLU3HCs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B0515624D
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Aug 2025 04:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754541468; cv=none; b=E79gL4DzokGv7ly+soMHzIbMicZXKGQDeL0MCdeQPFHBkJnlC2tctz7AqAaWpAqSG5OKGgDx6aTm8ZtDr0hYQkIdqhtuTASgLI9HF8Y8KA851vK0Djp7QO3YmKorClY/x18/j/KD3dV9QzwL7vI+PieWG9rvIKprjx03ZMFYM6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754541468; c=relaxed/simple;
	bh=DKSrqNGkYovOYBx8IViPKurcBp7/Sd5K17gThUNYF6A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=gyoi5nZrTl/fi6X8js3Up770j+laG+oaUpriZWieOTsB4ESHu8Y1/ad9omEEYTT/35mMKFr77tqqA7Qdm/tUk9rJqgqeILYY+5Ey1kTqU3+g3SE6qIVShlimf73CC/RUx1CyHeYEr+VPhRsV5MFHTnO6cX6SspRY7Meq7m/gYng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOLU3HCs; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-433f984820dso479340b6e.3
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Aug 2025 21:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754541466; x=1755146266; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y2wBKix6cNLV0MIFceTls4YQ6NYoslLzR+jcZmvYEX0=;
        b=kOLU3HCsG5uIAIcPH9uGXW/nNxBZEDdDbiR8aPq0jA4FjMurUfgKaoOmT5AzEU9iT7
         vJtpK6Y19JHJJth7uW+ZH50vXfWaVdx6hr7P6zDtRXeAEBCYZX2tx0vA2SZyamrXjubj
         VhaeauzqYoiBUWvUldFkCJ0L4ttvZPU7OV5uzOoGb4DCDmMUXtgxyZLPTroFoSjplrXH
         6SKXfgL+CRBw3sSZI+87J9Kq2M/uLTIvkOH8tjsFNjgRaV0LDZ0YUE29p6fCkyA/rn7F
         940GlwNcgG+wuYmaDpuDmUgyI3pT049mI1aJMZ0AHwoMB6NyWB1Tx8ZN8h2kOZS2ylwh
         P7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754541466; x=1755146266;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y2wBKix6cNLV0MIFceTls4YQ6NYoslLzR+jcZmvYEX0=;
        b=XcJU133qbmJ+L8jVFsirRADmRyU+RlU0xWg3BpRbA86IpqvAgkDuNrTxLPfoc0pD6q
         /1/O1cmceZ4jJGeFbywz0ngdB3KCeANOMsGoNE77Ro6Dk4TRKLk9FdDAUufN9c4c8iPr
         MZgYRu9aS9FVfMfWVIe9unSgfAuQsLlS9046p7fZAO6uVj0GuombudqwWRLBA3omRTbk
         u4D3LfJevDq5w4c+oWdlBi0DyVjRqMf52YLuNcCV7LAebipmB/l/n6SRNWz77dvX5zUm
         qnO/1EPg6Q4TsnQRDi4SqrjVOvR41v9Yv8V9PyuNB6vZznB1Guk0bl5KydmVRWEVEcE1
         I6gg==
X-Gm-Message-State: AOJu0YyTqEx1Y2zqaiXM8xcKGtGwOQTIF2OKYgcYj5uY+a3ZSMdDzVPl
	6E/MHYrZafTtvBhdfILOzCRCvWkzyno9ArlKxIx/LD06mgXz9AkABbkxfzIrZRNaVgE8PlXSV8O
	Gg/I71xB9SlwozQiXK9qQ8pVir0tT1FmromrS
X-Gm-Gg: ASbGnctkgvkLQj6I9GhbP+/KeGE4hT+W7pDzdr2NpaCrwA5Tcjvkd4HnwBtPSS6afI3
	kJXfDGZwof88WFcSJrNhSQceugm4mjI9TmgWw4MCb8JwhOJNX94Q/6y7yZIUxwHVprL+cVUdv4D
	1SYQMGQBeEThGoeckjYFVR8BuKTT8hdjKgcD/OmybrUevP3PG39Qj+NUrDHSje+B+Tc6Xz1GHUq
	HT3040=
X-Google-Smtp-Source: AGHT+IGfw9+VtjjngamGmK6nervyDkwq/5IBv+GigYFUW0YZRhnbeTH4jeA+6y01StaPINdvkCjOf6TXU2gY84o4064=
X-Received: by 2002:a05:6808:17a2:b0:435:6d0b:82c4 with SMTP id
 5614622812f47-4357c6637d4mr2294176b6e.36.1754541465953; Wed, 06 Aug 2025
 21:37:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "David F." <df7729@gmail.com>
Date: Wed, 6 Aug 2025 21:37:34 -0700
X-Gm-Features: Ac12FXzc6Z3Tp8HpkWJWwBkoLbKDIDkZaiMyK_4B94PQB5VpyLvh5ycVbBu_i3I
Message-ID: <CAGRSmLvRaFfLG-ksN=WHe3FrH4DOrcJud5BZynGhsrYc8c28ww@mail.gmail.com>
Subject: Unable to build custom amd64 module.
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

The last modules I built was from 6.6.x.  I'm trying to build for
6.15.x but it's failing for the amd64 version.    I'm building both a
686 and amd64 version of the module (driver) using the scripts I've
used a long time.   The system is Devuan Chimaera 686 version.   The
686 module builds fine, but the amd64 get to the point shown below and
fails.   Does it have to do with that warning?  What would cause that
in the amd64 version but not the 686 version (everything is compiled
from the same source).

Any ideas how to work around this or find the problem.   The error
code doesn't give me a clue of what it is:

  LD [M]  mydriver.o
mydriver.o: warning: objtool: .text+0x23f4: unannotated intra-function call
make[5]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/scripts/Makefile.build:408:
mydriver.o] Error 255
make[5]: *** Deleting file 'mydriver.o'
make[4]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/Makefile:2003: .] Error 2
make[3]: *** [/usr/src/linux-headers-6.15.6-amd64-mine/Makefile:248:
__sub-make] Error 2
make[3]: Leaving directory
'/media/sf_Source/mydriver/linux/driver/6.15.6-amd64-mine'
make[2]: *** [Makefile:248: __sub-make] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-6.15.6-amd64-mine'
make[1]: *** [Makefile:53: domake] Error 2
make[1]: Leaving directory '/media/sf_Source/mydriver/linux/driver'
make: *** [Makefile:44: all] Error 2
error: Build failed.

