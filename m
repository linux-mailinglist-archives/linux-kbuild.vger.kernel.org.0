Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0517777B6B
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2019 21:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388022AbfG0TOC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Jul 2019 15:14:02 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33915 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387935AbfG0TOC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jul 2019 15:14:02 -0400
Received: by mail-pl1-f194.google.com with SMTP id i2so25989607plt.1;
        Sat, 27 Jul 2019 12:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wO5ryPqtMtkawzhdPDfKYcjrd6FW04MNlIFZ1YLmrlI=;
        b=UVP5btvahUA/GdII08qTMaMAjzPXvsAX6hfDuv++5VHim+hgjAfFC/kuCu6dWsHCRN
         tvzsY6a8CAcShz0QTtli1LYw4Te2hxraX6Wd2DPZ9w/MmmHLOQQwNZR8NaoXSLfA0vls
         Oep4okBlQ30gFd+6sTA6a9WNL4DzSIYsUPygrEeT50z+g/IwOfPC4ab3+nvef77yu6dl
         +8QGpsGm2LUegCtgcKWGTVSX90Frc37g/FXV39f0jpnk5iRGgiJnAGBwj0q5V4/PVaiL
         gM+zbVIbGkfRd1Pyp9BjP99E2nLYYgKHQwvrxu5UNR+IW21qLF6NQKI5AwCYGBENDEBd
         d86Q==
X-Gm-Message-State: APjAAAX8ydACxuyTO6lVsTIWBbgC+Sg2F0qyIjR8HFEczvyIMSV59itn
        SeryRiaSZy+YrqVprfGxa6n1uDfk
X-Google-Smtp-Source: APXvYqwMEDE5KNRpmNVOGEdu4325iycA+No3DJf1kPKr4eJVPmmX03UbMaGnwY9zU6dl8UPNdGjAnQ==
X-Received: by 2002:a17:902:61:: with SMTP id 88mr97772568pla.50.1564254841568;
        Sat, 27 Jul 2019 12:14:01 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.gmail.com with ESMTPSA id n185sm36562727pga.16.2019.07.27.12.13.56
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Jul 2019 12:14:00 -0700 (PDT)
Subject: Re: [RFC PATCH] modpost: check for static EXPORT_SYMBOL* functions
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190714152817.24693-1-efremov@linux.com>
 <CAK7LNATg1m_pzsZqGDUOUZHzv6jn2K0My8vFWbOVdUSTMQ05Ug@mail.gmail.com>
From:   Denis Efremov <efremov@linux.com>
Message-ID: <5232680b-5303-3d63-db51-de65eea76e3a@linux.com>
Date:   Sat, 27 Jul 2019 22:13:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNATg1m_pzsZqGDUOUZHzv6jn2K0My8vFWbOVdUSTMQ05Ug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

> Could you drop the solved ones from the list?

Yes, of course. Do you want me to remove all symbols fixed with patches 
or only those are in-tree now?

Should it be like this:
  1. "torture_onoff_cleanup" [kernel/torture]
     "torture_shuffle_cleanup" [kernel/torture]
     Patch: https://lkml.org/lkml/2019/7/4/411 (accepted)
  2. "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress]
     Patch: https://lkml.org/lkml/2019/7/8/842
  3. "drm_client_close" [drivers/gpu/drm/drm]
     Patch: https://lkml.org/lkml/2019/7/3/758 (accepted)
  4. "ahci_em_messages" [drivers/ata/libahci]
     Patch: https://lkml.org/lkml/2019/7/10/550 (reviewed)
  5. "ftrace_set_clr_event" [vmlinux]
     Patch: https://lkml.org/lkml/2019/7/4/609 (reviewed)
  6. "rmi_2d_sensor_set_input_params" [drivers/input/rmi4/rmi_core]
     Patch: https://lkml.org/lkml/2019/7/8/999 (accepted)
  10. "empty_zero_page" [vmlinux]
  11. "phys_base" [vmlinux]
  12. "hypercall_page" [vmlinux]

Or like this:
  1. "empty_zero_page" [vmlinux]
  2. "phys_base" [vmlinux]
  3. "hypercall_page" [vmlinux]

Well, I could remove this list at all. It seems like the following list 
with existing commits is enough to show the problem of static exported 
functions.

I will resend the patch shortly after.

Regards,
Denis
