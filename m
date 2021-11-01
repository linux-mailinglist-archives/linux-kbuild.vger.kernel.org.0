Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38DE441943
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Nov 2021 10:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbhKAKCC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Nov 2021 06:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57684 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232590AbhKAKBc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Nov 2021 06:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635760739;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6caRVk8CMsSD+h3ZfXjPmUciaKaQW9ki6VuNt64p3I4=;
        b=dJCjkXxVcYWbStpUL5tUN2S2OfSFktAEboh9QrHBVckVcvtZiUPQXimO5YdpEuztqJwTcz
        s8iM9yB3Qj9bf1GYD8SZDEwO++TJNs4D+PnCCsbIrDZ/IdawLkAyY0eO/3uJs78NJ8vW7N
        uu/4W0RbHz7RCVdMl3Px2POuU0X9I/8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-QuYfJ0tdOx2sUiu4aPemXQ-1; Mon, 01 Nov 2021 05:58:58 -0400
X-MC-Unique: QuYfJ0tdOx2sUiu4aPemXQ-1
Received: by mail-ed1-f72.google.com with SMTP id w26-20020a056402071a00b003e28a389d04so2763113edx.4
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Nov 2021 02:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6caRVk8CMsSD+h3ZfXjPmUciaKaQW9ki6VuNt64p3I4=;
        b=z4xQ8Yj8FGmj4dQm3fSflmxfpKWv9bYc5aJ/EGbnItqX7kJnqg3LQTDo/sEkOZNqGE
         bqRoJkX7QLioX8icKQN8V9fXS2KG2yQpzkIjCaPiNFb/GBxRi/1J7CBnXJLBn+hzuCKG
         bdRXOVt1sgpofvp+n8g07mXt7k8/Byy5jc2heepHzfv7jQ/KmLehcnRp+tvswEA7kTvZ
         wFHB7K7EQ337a+6tZK0zsWWOZHDp70QWWVeoPuqPXPBqMwGEaWOZKUU1TBqvdArLJWjf
         9Hwm5W7K1TW4KVzqO7GpoOJSvK/oEvbYxQW87YWCtWlWDpxIZglm2R9LnEaJOPsWsiIu
         3xFA==
X-Gm-Message-State: AOAM530ki1AVl/GW1vC9mOjlRl1Crf8pDSeQQUGOEAd9JDKwr3a99fZS
        lwTS0bWOfjZht8zkYUypH2m+k9TytqYTSTA35fP4//IjnEuT/jLKhVtalmr6XjRMjXgQilYsqfW
        isA8A9rMy772hwSYR0dIA5u8V
X-Received: by 2002:a05:6402:40c6:: with SMTP id z6mr8288082edb.304.1635760736987;
        Mon, 01 Nov 2021 02:58:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqPXJ6PYGCriCtuynpl/6EfcOsgDa+TrNrye+hvH/EBNEyhX4X2nt67BIJf0jZlCcKYYLEcQ==
X-Received: by 2002:a05:6402:40c6:: with SMTP id z6mr8288065edb.304.1635760736808;
        Mon, 01 Nov 2021 02:58:56 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id x22sm8510583edv.14.2021.11.01.02.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 02:58:56 -0700 (PDT)
Message-ID: <cd712bd7-cce7-58fb-d644-ced4fc0c76b1@redhat.com>
Date:   Mon, 1 Nov 2021 10:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/6] HID: intel-ish-hid: add support for
 MODULE_DEVICE_TABLE()
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
References: <20211029152901.297939-1-linux@weissschuh.net>
 <20211029152901.297939-2-linux@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211029152901.297939-2-linux@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On 10/29/21 17:28, Thomas Weißschuh wrote:
> This allows to selectively autoload drivers for ISH devices.
> Currently all ISH drivers are loaded for all systems having any ISH
> device.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> ---
> 
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: Jiri Kosina <jkosina@suse.cz>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  include/linux/mod_devicetable.h   | 13 +++++++++++++
>  scripts/mod/devicetable-offsets.c |  3 +++
>  scripts/mod/file2alias.c          | 24 ++++++++++++++++++++++++
>  3 files changed, 40 insertions(+)
> 
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index ae2e75d15b21..befbf53c4b7c 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -895,4 +895,17 @@ struct dfl_device_id {
>  	kernel_ulong_t driver_data;
>  };
>  
> +/* ISHTP (Integrated Sensor Hub Transport Protocol) */
> +
> +#define ISHTP_MODULE_PREFIX	"ishtp:"
> +
> +/**
> + * struct ishtp_device_id - ISHTP device identifier
> + * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
> + * @context: pointer to driver specific data
> + */
> +struct ishtp_device_id {
> +	guid_t guid;

The kdoc comment documents a context pointer, but this is missing from the
actual struct. Having some sort of driver_data (1) field here would be good IMHO.

Regards,

Hans

1) "context" is fine, but AFAIK almost all other foo_device_id structs call this
driver_data, so that would be more consistent IMHO.


> +};
> +
>  #endif /* LINUX_MOD_DEVICETABLE_H */
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> index cc3625617a0e..c0d3bcb99138 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -259,5 +259,8 @@ int main(void)
>  	DEVID_FIELD(dfl_device_id, type);
>  	DEVID_FIELD(dfl_device_id, feature_id);
>  
> +	DEVID(ishtp_device_id);
> +	DEVID_FIELD(ishtp_device_id, guid);
> +
>  	return 0;
>  }
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 49aba862073e..5258247d78ac 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -115,6 +115,17 @@ static inline void add_uuid(char *str, uuid_le uuid)
>  		uuid.b[12], uuid.b[13], uuid.b[14], uuid.b[15]);
>  }
>  
> +static inline void add_guid(char *str, guid_t guid)
> +{
> +	int len = strlen(str);
> +
> +	sprintf(str + len, "%02X%02X%02X%02X-%02X%02X-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X",
> +		guid.b[3], guid.b[2], guid.b[1], guid.b[0],
> +		guid.b[5], guid.b[4], guid.b[7], guid.b[6],
> +		guid.b[8], guid.b[9], guid.b[10], guid.b[11],
> +		guid.b[12], guid.b[13], guid.b[14], guid.b[15]);
> +}
> +
>  /**
>   * Check that sizeof(device_id type) are consistent with size of section
>   * in .o file. If in-consistent then userspace and kernel does not agree
> @@ -1380,6 +1391,18 @@ static int do_mhi_entry(const char *filename, void *symval, char *alias)
>  	return 1;
>  }
>  
> +/* Looks like: ishtp:{guid} */
> +static int do_ishtp_entry(const char *filename, void *symval, char *alias)
> +{
> +	DEF_FIELD(symval, ishtp_device_id, guid);
> +
> +	strcpy(alias, ISHTP_MODULE_PREFIX "{");
> +	add_guid(alias, guid);
> +	strcat(alias, "}");
> +
> +	return 1;
> +}
> +
>  static int do_auxiliary_entry(const char *filename, void *symval, char *alias)
>  {
>  	DEF_FIELD_ADDR(symval, auxiliary_device_id, name);
> @@ -1499,6 +1522,7 @@ static const struct devtable devtable[] = {
>  	{"auxiliary", SIZE_auxiliary_device_id, do_auxiliary_entry},
>  	{"ssam", SIZE_ssam_device_id, do_ssam_entry},
>  	{"dfl", SIZE_dfl_device_id, do_dfl_entry},
> +	{"ishtp", SIZE_ishtp_device_id, do_ishtp_entry},
>  };
>  
>  /* Create MODULE_ALIAS() statements.
> 

