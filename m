Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3129E15C9F5
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2020 19:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgBMSHo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 13 Feb 2020 13:07:44 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43071 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727803AbgBMSHn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Feb 2020 13:07:43 -0500
Received: by mail-wr1-f66.google.com with SMTP id r11so7818202wrq.10
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Feb 2020 10:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KaYLRbofmlbTgQxgASAZ9ZnOvf0N33oCxSi9sUIei4I=;
        b=wTOBxI1H7V6s26W37OgLjwLXUaKusdI/x0oClflS3SZk2CElwrkCs8cq0e1daI77GO
         4cyQ8zXgHEvylkjAu39PlNdDH4VtIK9cflwpN7fhVH96jAWBKgKI6uLdoIMQ1GnBrBNR
         kpRvN1Qr1ngCsm0DEiCIgNUKW/pfvPbD8VvOiA6IzaSMv9cqXKLk4FDxZG1e8q8D6Wz8
         kw0rhss5vYTCfM4Iq4iJge16BLP9fZ4++WLGbRCUmrJUMLDIs+b6i8EmbRUKAt+AB/TZ
         TJ851nozan5lOdzCTFAPJeEfeXBOovOwai1v1qR5b/CAkyFRCzx0Q9UUJQZ9leRKKVJ5
         hTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KaYLRbofmlbTgQxgASAZ9ZnOvf0N33oCxSi9sUIei4I=;
        b=AUXVUnCjJaQ7OTcF3xNGnWvyGF4x6cZUK7p9G8rhECkmOSyeLx9I4RD95w1Vv9K0Ew
         69Uwrf28FmVSVWygUDttMnE8hQwMvh+pqDGXnlOjdMb9VEvLN5vIAgUSypqiSUb2XLr8
         RVatzhCaoYSWX7KpvE4nKqdkUU973Yld6SM9DqU3SR/zN2/ShvruOYVz8OWbLWARCizy
         bXfUq985MUQnk+aesANu30sEbz/MKp1rvDNHHaOLviACUkGbboKIrwwXKOV4HpaS3guI
         HhSd3CFW458NkwxzJjGXCu2/+JGD13nQ7ncpfSl9FrBmHnNtR+KLOlHYsYAsxYTVafKf
         nKHQ==
X-Gm-Message-State: APjAAAWxMXFY9Caxw4rcJA4J85Mi6CcFIVoWgHLFSV9hqG5Pz3rsaEhi
        pbb3cJpz2zL9ymWUrMRFVXbMqw==
X-Google-Smtp-Source: APXvYqzSirGpgSJVofAlU8rB0AOVfB1Ng4qE30eWi/La3vh9P/J5Ng6V7leHDlJb726qLeHCnj7zfw==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr22976061wrp.1.1581617260446;
        Thu, 13 Feb 2020 10:07:40 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id q130sm4331745wme.19.2020.02.13.10.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 10:07:39 -0800 (PST)
Date:   Thu, 13 Feb 2020 18:07:36 +0000
From:   Quentin Perret <qperret@google.com>
To:     kernel test robot <rong.a.chen@intel.com>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        masahiroy@kernel.org, nico@fluxnic.net,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        maennich@google.com, kernel-team@android.com, jeyu@kernel.org,
        hch@infradead.org
Subject: Re: [kbuild-all] Re: [PATCH v3 3/3] kbuild: generate autoksyms.h
 early
Message-ID: <20200213180736.GA157895@google.com>
References: <20200207180755.100561-4-qperret@google.com>
 <202002111002.wXBhAK5H%lkp@intel.com>
 <20200212195628.GA120870@google.com>
 <20200213084251.GU12867@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213084251.GU12867@shao2-debian>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thursday 13 Feb 2020 at 16:42:51 (+0800), kernel test robot wrote:
> I attached the build log for your reference.

Thanks!

<snip>
> scripts/kconfig/conf  --syncconfig Kconfig
>   SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
>   UPD     include/config/kernel.release
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
>   UPD     include/generated/utsrelease.h
>   HOSTCC  scripts/dtc/dtc.o
>   HOSTCC  scripts/dtc/flattree.o
> ./scripts/gen_autoksyms.sh: 24: ./scripts/gen_autoksyms.sh: [[: not found
> ./scripts/gen_autoksyms.sh: 35: ./scripts/gen_autoksyms.sh: [[: not found
> cat: /home/nfs/linux//dev/null: No such file or directory

OK, so that's the issue, which Nicolas pointed out earlier. That should
be fixed in v4.

Thanks,
Quentin
