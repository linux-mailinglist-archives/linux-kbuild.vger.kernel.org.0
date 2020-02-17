Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 320AC161474
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2020 15:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbgBQOX2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Feb 2020 09:23:28 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34536 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbgBQOX2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 09:23:28 -0500
Received: by mail-wm1-f66.google.com with SMTP id s144so21180wme.1
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 06:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y5MhYckXFi7E+U6LXNEiPSCxK67PLr+e99TA6/7sYAM=;
        b=Rzzz/Sfn1uQgXNWGQGaIWsEyP8+93DXjBoaUqHAsAnl21gystvq7FmsEebbPlmneJ4
         WPpaP8SSyqOfo8BKWzKhuiwyX1blJBmAEu3vlehSLUie8H2poU0YdqYVxJdrVIL3eSjN
         yhclUTKN4cIiRjj6T+DTlTeV2x/r/yWx8v+S49mHT3saeSUZ0CS8pWMjgcrStEQCMZ6k
         Cff6lwFkleSd8Wh2IesQnt5iaW9B/um4liCPAXtW4r5XPyXtrWmYCxWM0TPwKvhpqiBG
         WSkGO5scwqCPmq3XG+lpG1Tc23A+Q4KMBm28ms7SJdd0Bmhr2PBg5ItoCbN0OKxhUHhC
         v3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y5MhYckXFi7E+U6LXNEiPSCxK67PLr+e99TA6/7sYAM=;
        b=HQs3+SxmF0P+y6qo9CszaQJmPgxZXDtAREycIpwQnH9W9BJuefrp6kV55Pgvy8Vbvv
         BiBJkPtSEWsN7PkwnQ2JHFugjbveF5/nw54XD25Z8Q79PnZDXZkHEOwgp5yLIglcPDOC
         tRFa1nW5u8g9O2foOhMri2szIAdHP7acEtDyEDNjahYDqKb8T80hiaAGeRacmyonKPh4
         WL3Ta5PJQtTW/uBlI5GDzthnrgEWctRSa0TLNWjYgvL4phRhnOJsX99W1xh/5xVue4CO
         gMNKXfZw4ZdJb/kl71+8p12L91a2zEDG1u2P6pwOEgSt3sRz9HBYWkjiJ+i1uws1dWBY
         tPBw==
X-Gm-Message-State: APjAAAVsyI5pkgZq3CoELf+bzm6x40zAA5GRCNvmpIzqC4fx8GBWsnpf
        ExXWFqEblWakEHKphPtCPUQQqQ==
X-Google-Smtp-Source: APXvYqxtx8O8cc/7sFx4a3FPrPBFBkfOU2HN+J+iaVebQNuJy0JLt7+fy9XZJ4eSs8byroNULYIKWw==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr22528670wma.121.1581949406315;
        Mon, 17 Feb 2020 06:23:26 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id q9sm1147425wrx.18.2020.02.17.06.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 06:23:25 -0800 (PST)
Date:   Mon, 17 Feb 2020 14:23:22 +0000
From:   Quentin Perret <qperret@google.com>
To:     masahiroy@kernel.org, nico@fluxnic.net
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        maennich@google.com, kernel-team@android.com, jeyu@kernel.org,
        hch@infradead.org
Subject: Re: [PATCH v4 1/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200217142322.GA183353@google.com>
References: <20200212202140.138092-1-qperret@google.com>
 <20200212202140.138092-2-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212202140.138092-2-qperret@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wednesday 12 Feb 2020 at 20:21:38 (+0000), Quentin Perret wrote:
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index a904bf1f5e67..93f4d10e66e6 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -38,6 +38,10 @@ esac
>  # We need access to CONFIG_ symbols
>  . include/config/auto.conf
>  
> +# Use 'eval' to expand the whitelist path and check if it is relative
> +eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
> +[ "${ksym_wl:0:1}" = "/" ] || ksym_wl="$abs_srctree/$ksym_wl"

Our internal CI just informed me that this is *still* not quite POSIX
compliant ... I believe that the following should (finally) solve this
issue:

  [ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"

The above seems to work with bash, zsh, dash, posh and, IIUC, complies
with https://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html.
I'll try other shells and stare at the doc some more, but if there is a
preferred pattern in the kernel I'm happy to change it.

Thanks,
Quentin
